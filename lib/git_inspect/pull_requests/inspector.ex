defmodule GitInspect.PullRequests.Inspector do
  alias GitInspect.PullRequests.Repository

  def get_all_by_title(expected_title) do
    Repository.get_all()
    |> Enum.filter(&(&1.title == expected_title))
  end

  # get all merged requests by week
  def get_all_merged_requests_by_week() do
    Repository.get_all()
    |> Enum.reduce(%{}, &(do_get_all_merged_requests_by_week(&1, &2)))
  end

  defp do_get_all_merged_requests_by_week(pull, result) do
    parsed_date = pull.merged_at |> parse_iso_date()

    case parsed_date do
      {:ok, date} -> track_request(date, result)
      {:error, date} -> result
    end
  end

  defp parse_iso_date(date) do
    case date |> DateTime.from_iso8601() do
      {:ok, value, _} -> {:ok, value |> DateTime.to_date}
      {:error, error} -> {:error, error}
    end
  end

  defp track_request(date, result) do
    week_start = date |> get_week_start()
    result = result |> Map.update(week_start, 1, &(&1 + 1))
  end

  defp get_week_start(date) do
    Timex.beginning_of_week(date, :sun)
  end

  # get all unmerged closed by project
  def get_all_unmerged_closed_by_project() do
    Repository.get_all()
    |> Enum.reduce([], &(do_get_all_unmerged_closed_by_project(&1, &2)))
    |> Enum.sort(&(elem(&1, 1) > elem(&2, 1)))
  end

  defp do_get_all_unmerged_closed_by_project(pull, result) do
    case pull.closed_at != nil && pull.merged_at == nil do
      true -> result |> Keyword.update(pull.base.repo.name |> String.to_atom(), 1, &(&1 + 1))
      false -> result
    end
  end
end

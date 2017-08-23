defmodule GitInspect.PullRequests.Inspector do
  alias GitInspect.PullRequests.Repository

  def get_all_by_title(expected_title) do
    Repository.get_all()
    |> Enum.filter(&(&1.title == expected_title))
  end

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
end

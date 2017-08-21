defmodule GitInspect.PullRequests.Inspector do
  alias GitInspect.PullRequests.Repository

  def get_all_by_title(expected_title) do
    Repository.get_all()
    |> Enum.filter(&(&1.title == expected_title))
  end
end

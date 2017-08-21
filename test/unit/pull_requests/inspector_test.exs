defmodule GitInspect.PullRequests.InspectorTest do
  use ExUnit.Case
  alias GitInspect.PullRequests.Inspector

  test "get all by title returns only pull requests with the specified title" do
    expected_title = "feature-1"

    pulls = Inspector.get_all_by_title(expected_title)

    assert pulls |> is_list()
    assert pulls |> Enum.each(&(assert &1.title == expected_title))
  end
end

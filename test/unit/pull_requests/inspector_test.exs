defmodule GitInspect.PullRequests.InspectorTest do
  use ExUnit.Case
  alias GitInspect.PullRequests.Inspector

  test "get all by title returns only pull requests with the specified title" do
    expected_title = "feature-1"

    pulls = Inspector.get_all_by_title(expected_title)

    assert pulls |> is_list()
    assert pulls |> Enum.each(&(assert &1.title == expected_title))
  end

  test "get all merged requests by week over time returns only merged pull requests and groups them by week" do
    expected_result =%{
      ~D[2011-01-23] => 1,
      ~D[2012-01-22] => 1
    }

    pulls = Inspector.get_all_merged_requests_by_week()

    assert pulls |> is_map()
    assert pulls == expected_result
  end
end

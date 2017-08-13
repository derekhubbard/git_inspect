defmodule GitInspect.PullRequests.InspectorTest do
  use ExUnit.Case
  alias GitInspect.PullRequests.Inspector

  test "returns pull requests filtered by title" do
    expected_title = "new-feature"

    pull_requests = Inspector.get_by_title(expected_title)
    assert pull_requests |> length >= 1

    [pull_request | _] = pull_requests
    assert pull_request["title"] == expected_title
  end
end

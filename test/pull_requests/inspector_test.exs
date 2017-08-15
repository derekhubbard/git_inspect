defmodule GitInspect.PullRequests.InspectorTest do
  use ExUnit.Case, async: true
  alias GitInspect.PullRequests.Inspector

  test "get all returns all pull requests" do
    pulls = Inspector.get_all()
    assert pulls |> length > 0
  end

  test "returns pull requests filtered by title" do
    expected_title = "new-feature"

    pull_requests = Inspector.get_by_title(expected_title)
    assert pull_requests |> length >= 1

    [pull_request | _] = pull_requests
    assert pull_request["title"] == expected_title
  end
end

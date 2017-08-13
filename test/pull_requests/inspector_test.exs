defmodule GitInspect.PullRequests.InspectorTest do
  use ExUnit.Case
  alias GitInspect.PullRequests.Inspector

  test "returns pull requests filtered by name" do
    expected_name = "pull request name"

    pull_requests = Inspector.get_by_name(expected_name)
    assert pull_requests |> length >= 1

    [pull_request | _] = pull_requests
    assert pull_request.name == expected_name
  end
end

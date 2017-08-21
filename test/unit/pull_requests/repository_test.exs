defmodule GitInspect.PullRequests.RepositoryTest do
  use ExUnit.Case, async: true
  alias GitInspect.PullRequests.Repository

  test "get all returns all pull requests" do
    pulls = Repository.get_all()
    assert pulls |> is_list()
    assert pulls |> length > 0
  end

  test "returns pull requests filtered by title" do
    expected_title = "new-feature"

    pull_requests = Repository.get_by_title(expected_title)
    assert pull_requests |> is_list()
    assert pull_requests |> length > 0

    [pull_request | _] = pull_requests
    assert pull_request["title"] == expected_title
  end
end

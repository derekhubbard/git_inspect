defmodule GitInspect.Github.PullRequestsIntegrationTest do
  use ExUnit.Case
  alias GitInspect.Github.GithubClient

  @moduletag :github_api

  test "list retrieves pull requests from github" do
    user = "octocat"
    repo = "Hello-World"

    result = GithubClient.get("repos/#{user}/#{repo}/pulls")

    assert is_list(result)
    assert length(result) > 0
  end
end

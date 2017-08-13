defmodule GitInspect.Github.PullRequestsIntegrationTest do
  use ExUnit.Case
  alias GitInspect.Github.GithubClient

  @moduletag :github_api
  @moduletag :skip

  test "list retrieves pull requests from github" do
    user = "lodash"
    repo = "lodash"

    pull_requests = GithubClient.get("repos/#{user}/#{repo}/pulls")

    assert is_list(pull_requests)
  end
end

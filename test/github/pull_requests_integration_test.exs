defmodule GitInspect.Github.PullRequestsIntegrationTest do
  use ExUnit.Case
  alias GitInspect.Github.GithubClient

  @moduletag :github_api

  test "list retrieves pull requests from github" do
    user = "octocat"
    repo = "Hello-World"

    {:ok, %HTTPoison.Response{headers: _headers, body: body, status_code: status_code}} = GithubClient.get("repos/#{user}/#{repo}/pulls")

    assert status_code == 200
    assert is_list(body)
  end
end

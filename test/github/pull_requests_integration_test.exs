defmodule GitInspect.Github.PullRequestsIntegrationTest do
  use ExUnit.Case
  require Logger
  alias GitInspect.Github.GithubClient

  @moduletag :github_api

  test "list retrieves pull requests from github" do
    user = "octocat"
    repo = "Hello-World"

    # {:ok, %HTTPoison.Response{headers: _headers, body: body, status_code: status_code}} = GithubClient.get("repos/#{user}/#{repo}/pulls")
    options = [params: [{:state, "all"}]]
    # options = [params: [{:state, "all"}]]
    response = GithubClient.get("repos/#{user}/#{repo}/pulls", [], options)
    # Logger.debug inspect(response)

    # assert status_code == 200
    # assert is_list(body)
  end
end

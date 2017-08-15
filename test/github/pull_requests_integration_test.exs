defmodule GitInspect.Github.PullRequestsIntegrationTest do
  use ExUnit.Case
  alias GitInspect.Github.GithubClient

  @moduletag :github_api
  # @moduletag :skip

  test "list retrieves pull requests from github" do
    user = "octocat"
    repo = "Hello-World"

    params = [{:state, "all"}]
    result = GithubClient.get("repos/#{user}/#{repo}/pulls", [], [params: params])

    assert is_list(result)
    assert length(result) > 0

    IO.puts "Pull requests retrieved: #{length(result)}"
  end
end

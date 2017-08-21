defmodule GitInspect.Github.PullRequestsIntegrationTest do
  use ExUnit.Case
  alias GitInspect.Github.GithubClient

  @moduletag :github_api

  test "list retrieves pull requests from github" do
    user = "octocat"
    repo = "Hello-World"

    params = [{:state, "all"}]
    results = GithubClient.get("repos/#{user}/#{repo}/pulls", [], [params: params])

    # IO.puts inspect(results)
    assert results |> is_list()
    assert results |> length() > 0

    IO.puts "Pull requests retrieved: #{results |> length()}"

    results |> Enum.each(&(assert &1.base.user.login == user))
    results |> Enum.each(&(assert &1.base.repo.name == repo))
  end
end

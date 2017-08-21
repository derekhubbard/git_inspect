defmodule GitInspect.Github.RepositoriesIntegrationTest do
  use ExUnit.Case
  alias GitInspect.Github.GithubClient

  @moduletag :github_api

  test "list users retrieves repositories from github" do
    user = "octocat"

    results = GithubClient.get("users/#{user}/repos")
    # IO.puts inspect(results)

    assert is_list(results)
    assert length(results) > 0

    results
    |> Enum.each(&(assert &1.owner.login == "octocat"))
  end
end

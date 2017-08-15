defmodule GitInspect.Github.RepositoriesIntegrationTest do
  use ExUnit.Case
  alias GitInspect.Github.GithubClient

  @moduletag :github_api

  test "list users retrieves repositories from github" do
    user = "octocat"
    result = GithubClient.get("users/#{user}/repos")
    assert is_list(result)
    assert length(result) > 0

    [first_result | _] = result
    assert_repo_properties(first_result)
  end

  defp assert_repo_properties(_repo) do
    # repo.
  end
end

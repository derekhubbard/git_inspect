defmodule GitInspect.Github.RepositoriesIntegrationTest do
  use ExUnit.Case, async: true
  alias GitInspect.Github.GithubClient

  @moduletag :github_api

  test "list users retrieves repositories from github" do
    user = "octocat"
    result = GithubClient.get("users/#{user}/repos")
    assert is_list(result)
    assert length(result) > 0
  end
end

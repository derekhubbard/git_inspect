defmodule GitInspect.Github.RepositoriesIntegrationTest do
  use ExUnit.Case
  alias GitInspect.Github.GithubClient

  @moduletag :github_api

  test "list users retrieves repositories from github" do
    user = "lodash"
    {:ok, %HTTPoison.Response{headers: _headers, body: body, status_code: status_code}} = GithubClient.get("users/#{user}/repos")

    assert status_code == 200
    assert is_list(body)
  end
end
defmodule GitInspect.Github.GithubClientTest do
  use ExUnit.Case
  alias GitInspect.Github.GithubClient

  test "builds the full url for the github graphql api" do
    base_url = Application.get_env(:git_inspect, :github_endpoint)
    route = "/test_route"

    result = GithubClient.process_url(route)

    assert result == base_url <> route
  end
end

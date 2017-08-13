defmodule GitInspect.Github.GithubClientTest do
  use ExUnit.Case
  alias GitInspect.Github.GithubClient

  test "adds the authorization header to the request headers" do
    existing_headers = []

    headers = GithubClient.process_request_headers(existing_headers)

    assert headers |> length == 1
    assert Keyword.has_key?(headers, :Authorization)
  end

  test "builds the full url for the github v3 rest api" do
    base_url = Application.get_env(:git_inspect, :github_endpoint)
    route = "test_route"

    result = GithubClient.process_url(route)

    assert result == base_url <> route
  end
end

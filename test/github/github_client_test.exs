defmodule GitInspect.Github.GithubClientTest do
  use ExUnit.Case
  alias GitInspect.Github.GithubClient

  test "adds the authorization header to the request headers" do
    existing_headers = []

    headers = GithubClient.process_request_headers(existing_headers)

    assert headers |> length == 1
    assert Keyword.has_key?(headers, :Authorization)
  end
end

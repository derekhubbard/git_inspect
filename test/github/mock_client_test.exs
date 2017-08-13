defmodule GitInspect.Github.MockClientTest do
  use ExUnit.Case
  alias GitInspect.Github.MockClient

  test "getting user repositories returns list of repositories" do
    {:ok, %HTTPoison.Response{headers: _headers, body: body, status_code: 200}} = MockClient.get("users/testuser/repos")
    assert length(body) > 0
  end
end

defmodule GitInspect.Github.MockClientTest do
  use ExUnit.Case, async: true
  alias GitInspect.Github.MockClient

  test "getting user repositories returns list of repositories" do
    results = MockClient.get("users/testuser/repos")
    assert length(results) > 0
  end
end

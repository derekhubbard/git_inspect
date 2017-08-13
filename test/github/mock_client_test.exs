defmodule GitInspect.Github.MockClientTest do
  use ExUnit.Case
  alias GitInspect.Github.MockClient

  test "getting user repositories returns list of repositories" do
    repositories = MockClient.get("users/testuser/repos")

    assert length(repositories) > 0
  end
end

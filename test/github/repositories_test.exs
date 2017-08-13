defmodule GitInspect.Github.RepositoriesTest do
  use ExUnit.Case
  alias GitInspect.Github.Repositories

  test "list users retrieves repositories for the specified user" do
    test_user = "lodash"
    repositories = Repositories.list_users(test_user)

    repositories |> Enum.each(&(assert &1.user == test_user))
  end
end

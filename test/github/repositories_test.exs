defmodule GitInspect.Github.RepositoriesTest do
  use ExUnit.Case
  alias GitInspect.Github.Repositories

  test "list users retrieves repositories for the specified user" do
    user = "lodash"
    repositories = Repositories.list_users(user)

    repositories |> Enum.each(&(assert &1.user == user))
  end
end

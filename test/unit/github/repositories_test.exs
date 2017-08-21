defmodule GitInspect.Github.RepositoriesTest do
  use ExUnit.Case, async: true
  alias GitInspect.Github.Repositories

  test "list users retrieves repositories for the specified user" do
    user = "octocat"
    repositories = Repositories.list_users(user)

    repositories |> Enum.each(&(assert &1.owner.login == user))
  end
end

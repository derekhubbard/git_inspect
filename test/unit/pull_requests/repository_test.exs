defmodule GitInspect.PullRequests.RepositoryTest do
  use ExUnit.Case, async: true
  alias GitInspect.PullRequests.Repository

  test "get all returns all pull requests" do
    pulls = Repository.get_all()
    assert pulls |> is_list()
    assert pulls |> length > 0
  end
end

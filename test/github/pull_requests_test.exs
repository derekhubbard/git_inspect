defmodule GitInspect.Github.PullRequestsTest do
  use ExUnit.Case
  alias GitInspect.Github.PullRequests

  test "list retrieves pull requests for the specified owner and repository" do
    owner = "lodash"
    repository = "lodash.com"

    pulls = PullRequests.list(owner, repository)

    pulls |> Enum.each(&(assert &1.owner == owner))
    pulls |> Enum.each(&(assert &1.repository == repository))
  end
end

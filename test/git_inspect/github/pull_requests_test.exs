defmodule GitInspect.Github.PullRequestsTest do
  use ExUnit.Case, async: true
  alias GitInspect.Github.PullRequests

  test "list retrieves pull requests for the specified owner and repository" do
    owner = "octocat"
    repository = "Hello-World"

    pulls = PullRequests.list(owner, repository)

    pulls |> Enum.each(&(assert &1["head"]["repo"]["owner"]["login"] == owner))
    pulls |> Enum.each(&(assert &1["head"]["repo"]["name"] == repository))
  end
end

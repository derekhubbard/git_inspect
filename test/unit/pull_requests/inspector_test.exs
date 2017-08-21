defmodule GitInspect.PullRequests.InspectorTest do
  use ExUnit.Case
  alias GitInspect.PullRequests.Repository

  # test "returns pull requests filtered by title" do
  #   expected_title = "new-feature"
  #
  #   pull_requests = Repository.get_by_title(expected_title)
  #   assert pull_requests |> is_list()
  #   assert pull_requests |> length > 0
  #
  #   [pull_request | _] = pull_requests
  #   assert pull_request["title"] == expected_title
  # end

  # test "get all by title returns only pull requests with the specified title" do
  #   Repository.get_all
  #   |> Enum.filter(&(&1))
  # end

  test "get all by title returns only pull requests with the specified title" do
    expected_title = "new-feature"

    pulls = Repository.get_all()

    assert pulls |> is_list()
    assert pulls |> Enum.each(&(assert &1.title == expected_title))
  end
end

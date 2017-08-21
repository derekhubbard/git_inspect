defmodule GitInspect.PullRequests.InspectorTest do
  use ExUnit.Case
  alias GitInspect.PullRequests.Inspector

  test "get all by title returns only pull requests with the specified title" do
    expected_title = "new-feature"

    pulls = Inspector.get_all()

    assert pulls |> is_list()
    assert pulls |> Enum.each(&(assert &1.title == expected_title))
  end
end

defmodule GitInspect.Github.LocalClient do
  def get_pull_requests(organization) do
    [
      %{id: 1, name: "one pull request"},
      %{id: 2, name: "another pull request"}
    ]
  end
end

defmodule GitInspect.Github.LocalRepo do
  def get_pull_requests(_organization) do
    [
      %{id: 1, name: "one pull request"},
      %{id: 2, name: "another pull request"}
    ]
  end
end

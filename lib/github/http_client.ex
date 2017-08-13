defmodule GitInspect.Github.HttpClient do
  def get_pull_requests(_organization) do
    # TODO: Retrieve pull requests for provided organization
    [%{id: 1, name: "this one came from github"}]
  end
end

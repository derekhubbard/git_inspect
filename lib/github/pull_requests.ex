defmodule GitInspect.Github.PullRequests do
  @github_client Application.get_env(:git_inspect, :github_client)

  def list(owner, repo) do
    @github_client.get("repos/#{owner}/#{repo}/pulls")
  end
end

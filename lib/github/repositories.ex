defmodule GitInspect.Github.Repositories do
  @github_client Application.get_env(:git_inspect, :github_client)

  def list_users(username) do
    @github_client.get("users/#{username}/repos")
  end
end

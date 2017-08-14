defmodule GitInspect.Github.Repositories do
  require Logger

  @github_client Application.get_env(:git_inspect, :github_client)

  def list_users(username) do
    Logger.debug fn -> "Retrieving repositories. username: #{username}" end
    result = @github_client.get("users/#{username}/repos")

    case result do
      { status_code, body } -> Logger.error fn -> "HTTP error retrieving repositories. status_code: #{status_code}, body: #{inspect(body)}" end
      _ -> result
    end
  end
end

defmodule GitInspect.Github.Repositories do
  require Logger

  @github_client Application.get_env(:git_inspect, :github_client)

  def list_users(username) do
    Logger.debug fn -> "Retrieving repositories. username: #{username}" end
    {result, response} = @github_client.get("users/#{username}/repos")

    case result do
      :ok -> process_list_users_response(response)
      _ -> Logger.error fn -> "Elixir error retrieving repositories. response: #{inspect(response)}" end
    end
  end

  defp process_list_users_response(%HTTPoison.Response{headers: _headers, body: body, status_code: status_code}) do
    case status_code do
      200 -> body
      _ -> Logger.error fn -> "HTTP error retrieving repositories. status_code: #{status_code}, body: #{inspect(body)}" end
    end
  end
end

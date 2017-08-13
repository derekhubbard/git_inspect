defmodule GitInspect.Github.Repositories do
  @github_client Application.get_env(:git_inspect, :github_client)

  def list_users(username) do
    {result, response} = @github_client.get("users/#{username}/repos")

    case result do
      :ok -> process_list_users_response(response)
      _ -> []
    end
  end

  defp process_list_users_response(%HTTPoison.Response{headers: _headers, body: body, status_code: status_code}) do
    case status_code do
      200 -> body
      _ -> [] #TODO: we should add some logging around this
    end
  end
end

defmodule GitInspect.Github.PullRequests do
  @github_client Application.get_env(:git_inspect, :github_client)

  def list(owner, repo) do
    {result, response} = @github_client.get("repos/#{owner}/#{repo}/pulls")

    case result do
      :ok -> process_list_response(response)
      _ -> []
    end
  end

  defp process_list_response(%HTTPoison.Response{headers: _headers, body: body, status_code: status_code}) do
    case status_code do
      200 -> body
      _ -> [] #TODO: we should add some logging around this
    end
  end
end

defmodule GitInspect.Github.PullRequests do
  require Logger

  @github_client Application.get_env(:git_inspect, :github_client)

  def list(owner, repo) do
    Logger.debug fn -> "Retrieving pull requests. owner: #{owner}, repository: #{repo}" end
    options = [params: [{:state, "all"}, {:page, 5}]]
    {result, response} = @github_client.get("repos/#{owner}/#{repo}/pulls", [], options)

    case result do
      :ok -> process_list_response(response)
      _ -> Logger.error fn -> "Elixir error retrieving pull requests. response: #{inspect(response)}" end
    end
  end

  defp process_list_response(%HTTPoison.Response{headers: headers, body: body, status_code: status_code, request_url: url}) do
    Logger.debug inspect(headers)
    case status_code do
      200 -> body
      _ -> Logger.error fn -> "HTTP error retrieving pull requests. status_code: #{status_code}, body: #{inspect(body)}" end
    end
  end
end

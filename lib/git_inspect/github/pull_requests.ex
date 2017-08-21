defmodule GitInspect.Github.PullRequests do
  require Logger

  @github_client Application.get_env(:git_inspect, :github_client)

  def list(owner, repo, state \\ "all") do
    Logger.debug fn -> "Retrieving pull requests. owner: #{owner}, repository: #{repo}" end
    params = [{:state, state}]
    result = @github_client.get("repos/#{owner}/#{repo}/pulls", [], [params: params])

    case result do
      { status_code, body } -> Logger.error fn -> "HTTP error retrieving pull requests. status_code: #{status_code}, body: #{inspect(body)}" end
      _ -> result
    end
  end
end

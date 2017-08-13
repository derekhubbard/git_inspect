defmodule GitInspect.Github.GithubClient do
  use HTTPoison.Base

  @endpoint Application.get_env(:git_inspect, :github_endpoint)
  @auth_token Application.get_env(:git_inspect, :github_auth_token)

  def process_request_headers(headers) do
    headers ++ ["Authorization": "bearer #{@auth_token}"]
  end

  def process_url(url) do
    @endpoint <> url
  end
end

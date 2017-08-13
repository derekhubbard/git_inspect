defmodule GitInspect.Github.GithubClient do
  use HTTPoison.Base

  @auth_token Application.get_env(:git_inspect, :github_auth_token)

  def process_request_headers(headers) do
    headers ++ ["Authorization": "Bearer #{@auth_token}"]
  end

  def process_url(url) do
    "https://api.github.com/graphql" <> url
  end
end

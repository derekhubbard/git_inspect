defmodule GitInspect.Github.GithubClient do
  use HTTPoison.Base

  def process_request_headers(headers) do
    headers ++ ["Authorization": "Bearer 123"]
  end

  def process_url(url) do
    "https://api.github.com/graphql" <> url
  end
end

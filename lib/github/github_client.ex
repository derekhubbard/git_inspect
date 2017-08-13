defmodule GitInspect.Github.GithubClient do
  use HTTPoison.Base

  def process_url(url) do
    "https://api.github.com/graphql" <> url
  end
end

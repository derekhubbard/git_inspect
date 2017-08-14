defmodule GitInspect.Github.MockClient do
  require Logger
  alias GitInspect.Github.MockRepo
  def get(url, [], _), do: get(url)
  def get(url) do
    case String.split(url, "/") do
      ["users", _username, "repos"] -> repositories_list_users(url)
      ["repos", _owner, _repo, "pulls"] -> pulls_list(url)
      [_] -> Logger.error "Not supported yet"
    end
  end

  defp repositories_list_users(url) do
    repositories = [
      MockRepo.get_repo()
    ]
    {:ok, %HTTPoison.Response{headers: nil, body: repositories, status_code: 200, request_url: url}}
  end

  defp pulls_list(url) do
    pulls = [
      MockRepo.get_pull_request()
    ]
    {:ok, %HTTPoison.Response{headers: nil, body: pulls, status_code: 200, request_url: url}}
  end
end

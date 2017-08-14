defmodule GitInspect.Github.MockClient do
  alias GitInspect.Github.MockRepo

  def get(url) do
    case String.split(url, "/") do
      ["users", _username, "repos"] -> repositories_list_users()
      ["repos", _owner, _repo, "pulls"] -> pulls_list()
      [_] -> IO.puts("Not supported yet")
    end
  end

  defp repositories_list_users() do
    repositories = [
      MockRepo.get_repo()
    ]
    {:ok, %HTTPoison.Response{headers: nil, body: repositories, status_code: 200}}
  end

  defp pulls_list() do
    pulls = [
      MockRepo.get_pull_request()
    ]
    {:ok, %HTTPoison.Response{headers: nil, body: pulls, status_code: 200}}
  end
end

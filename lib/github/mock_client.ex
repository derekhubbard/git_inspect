defmodule GitInspect.Github.MockClient do
  alias GitInspect.Github.MockRepo

  @repo File.read("mock_repo.json")

  def get(url) do
    case String.split(url, "/") do
      ["users", username, "repos"] -> repositories_list_users(username)
      ["repos", owner, repo, "pulls"] -> pulls_list(owner, repo)
      [_] -> IO.puts("Not supported yet")
    end
  end

  defp repositories_list_users(username) do
    repositories = [
      MockRepo.get_repo()
    ]
    {:ok, %HTTPoison.Response{headers: nil, body: repositories, status_code: 200}}
  end

  defp pulls_list(owner, repo) do
    pulls = [
      %{ id: 1, owner: owner, repository: repo, name: "pull request name" }
    ]
    {:ok, %HTTPoison.Response{headers: nil, body: pulls, status_code: 200}}
  end
end

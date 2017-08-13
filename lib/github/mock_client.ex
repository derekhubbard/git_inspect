defmodule GitInspect.Github.MockClient do
  def get(url) do
    case String.split(url, "/") do
      ["users", username, "repos"] -> repositories_list_users(username)
      ["repos", owner, repo, "pulls"] -> pulls_list(owner, repo)
      [_] -> IO.puts("Not supported yet")
    end
  end

  defp repositories_list_users(username) do
    # TODO: Replace this list of pull requests with repositories
    repositories = [
      %{ id: 1, name: "one pull request", user: username },
      %{ id: 2, name: "another pull request", user: username }
    ]

    {:ok, %HTTPoison.Response{headers: nil, body: repositories, status_code: 200}}
  end

  defp pulls_list(owner, repo) do
    [
      %{ id: 1, owner: owner, repository: repo, name: "pull request name" }
    ]
  end
end

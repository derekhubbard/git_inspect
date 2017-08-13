defmodule GitInspect.Github.MockClient do
  def get(url) do
    case String.split(url, "/") do
      ["users", username, "repos"] -> repositories_list_users(username)
      [_] -> IO.puts("Not support yet")
    end
  end

  defp repositories_list_users(username) do
    # TODO: Replace this list of pull requests with repositories
    [
      %{ id: 1, name: "one pull request", user: username },
      %{ id: 2, name: "another pull request", user: username }
    ]
  end
end

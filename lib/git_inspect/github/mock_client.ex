defmodule GitInspect.Github.MockClient do
  import GitInspect.Factory
  require Logger
  alias GitInspect.Github.MockData

  def get(url, _headers \\ [], _options \\ []) do
    case String.split(url, "/") do
      ["users", _username, "repos"] -> repositories_list_users()
      ["repos", _owner, _repo, "pulls"] -> pulls_list()
      [_] -> Logger.error "Not supported yet"
    end
  end

  defp repositories_list_users() do
    [
      build(:repository)
    ]
  end

  defp pulls_list() do
    [
      build(:pull_request)
    ]
  end
end

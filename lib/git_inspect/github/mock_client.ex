defmodule GitInspect.Github.MockClient do
  require Logger
  alias GitInspect.Github.MockRepo

  def get(url, _headers \\ [], _options \\ []) do
    case String.split(url, "/") do
      ["users", _username, "repos"] -> repositories_list_users()
      ["repos", _owner, _repo, "pulls"] -> pulls_list()
      [_] -> Logger.error "Not supported yet"
    end
  end

  defp repositories_list_users() do
    [ MockRepo.get_repo() ]
  end

  defp pulls_list() do
    [ MockRepo.get_pull_request() ]
  end
end

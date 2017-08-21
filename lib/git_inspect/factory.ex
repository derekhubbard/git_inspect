defmodule GitInspect.Factory do
  use ExMachina

  @mock_repository "fixtures/github_repository.json"
  @mock_pull_request "fixtures/github_pull_request.json"

  def repository_factory do
    repository = File.read!(@mock_repository)
    |> decode()

    repository
  end

  def pull_request_factory do
    File.read!(@mock_pull_request)
    |> decode()
  end

  defp decode(json) do
    json |> JSX.decode!([{:labels, :atom}])
  end
end

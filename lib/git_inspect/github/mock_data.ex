defmodule GitInspect.Github.MockData do

  @mock_repo "fixtures/mock_repo.json"
  @mock_pull_request "fixtures/mock_pull_request.json"

  def get_repo do
    read_mock_file(@mock_repo)
  end

  def get_pull_request do
    read_mock_file(@mock_pull_request)
  end

  defp read_mock_file(path) do
    File.read!(path)
    |> JSX.decode!
  end
end

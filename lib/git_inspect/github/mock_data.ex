defmodule GitInspect.Github.MockData do

  @mock_repository "fixtures/github_repository.json"
  @mock_pull_request "fixtures/github_pull_request.json"

  def get_repository do
    read_mock_file(@mock_repository)
  end

  def get_pull_request do
    read_mock_file(@mock_pull_request)
  end

  defp read_mock_file(path) do
    File.read!(path)
    |> JSX.decode!
  end
end

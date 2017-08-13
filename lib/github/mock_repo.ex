defmodule GitInspect.Github.MockRepo do

  @mock_repo "fixtures/mock_repo.json"

  def get_repo do
    File.read!(@mock_repo)
    |> JSX.decode!
  end
end

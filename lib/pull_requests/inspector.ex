defmodule GitInspect.PullRequests.Inspector do
  use GenServer

  @github_api Application.get_env(:git_inspect, :github_api)

  # client api

  def start_link(organization) do
    IO.puts "#### Starting pull request inspector for #{organization}..."
    GenServer.start_link(__MODULE__, organization, name: __MODULE__)
  end

  def get_by_name(name) do
    GenServer.call(__MODULE__, {:get_by_name, name})
  end

  # server api

  def init(organization) do
    {:ok, load(organization)}
  end

  defp load(organization) do
    IO.puts "#### Retrieving pull requests for #{organization}..."
    # TODO: load pull requests from github
    pull_requests = @github_api.get_pull_requests(organization)
    IO.puts "#### Pull requests retrieved."
    pull_requests
  end

  def handle_call({:get_by_name, name}, _from, pulls) do
    filtered_pulls = pulls
    |> Enum.filter(&(&1.name == name))

    {:reply, filtered_pulls, pulls}
  end
end

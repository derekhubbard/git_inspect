defmodule GitInspect.PullRequests.Inspector do
  use GenServer
  alias GitInspect.Github.Repositories

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
    IO.puts "#### Retrieving repositories and pull requests for #{organization}..."

    repositories = Repositories.list_users(organization)

    # TODO: retrieve pull requests

    IO.puts "#### Repositories and pull requests retrieved."
    repositories
  end

  def handle_call({:get_by_name, name}, _from, pulls) do
    filtered_pulls = pulls
    |> Enum.filter(&(&1.name == name))

    {:reply, filtered_pulls, pulls}
  end
end

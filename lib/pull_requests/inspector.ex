defmodule GitInspect.PullRequests.Inspector do
  use GenServer
  alias GitInspect.Github.{Repositories, PullRequests}

  # client api

  def start_link(organization) do
    IO.puts "#### Starting pull request inspector for #{organization}..."
    GenServer.start_link(__MODULE__, organization, name: __MODULE__)
  end

  def get_by_title(name) do
    GenServer.call(__MODULE__, {:get_by_title, name})
  end

  # server api

  def init(organization) do
    {:ok, load(organization)}
  end

  defp load(organization) do
    IO.puts "#### Retrieving repositories and pull requests for #{organization}..."

    # note: these are going to be synchronous/blocking calls.
    # we can replace this with async queues/tasks to speed this up if performance is an issue.
    repositories = load_repositories(organization)
    pull_requests = repositories
    |> load_pull_requests

    IO.puts "#### Repositories and pull requests retrieved."
    pull_requests
  end

  defp load_repositories(organization) do
    Repositories.list_users(organization)
  end

  defp load_pull_requests(repositories) do
    repositories |> Enum.reduce([], &(&2 ++ PullRequests.list(&1["owner"]["login"], &1["name"])))
  end

  def handle_call({:get_by_title, title}, _from, pulls) do
    filtered_pulls = pulls
    |> Enum.filter(&(&1["title"] == title))

    {:reply, filtered_pulls, pulls}
  end
end

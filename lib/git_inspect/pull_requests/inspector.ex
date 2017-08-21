defmodule GitInspect.PullRequests.Inspector do
  alias GitInspect.PullRequests.Repository

  def get_all() do
    Repository.get_all()
  end
end

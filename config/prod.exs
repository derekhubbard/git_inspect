use Mix.Config

config :git_inspect, :github_client, GitInspect.Github.GithubClient

# Finally import the config/prod.secret.exs
# which should be versioned separately.
import_config "prod.secret.exs"

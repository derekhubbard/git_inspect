# GitInspect
GitInspect is an Elixir application for retrieving data from Github and then analyzing it in interesting ways.

## Installation
GitInspect is an Elixir application. Elixir and the Erlang VM will need to be installed to run GitInspect locally.

For information on installing Elixir and the Erlang VM, check out the [official Elixir documentation](https://elixir-lang.org/install.html).

## Github Authentication
GitInspect uses the Github REST API v3 to retrieve data and store it locally in memory. To authenticate with Github, create a new personal access token.

For information on creating a new personal access token for Github, check out [this help documentation](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/).

GitInspect currently supports specifying the personal access token using an environment variable named `GITHUB_AUTH_TOKEN`.

```
GITHUB_AUTH_TOKEN="<ENTER_AUTH_TOKEN_HERE>"
```

This can be specified on the command line before running the application.

## Running
To run GitInspect, set the `MIX_ENV` environment variable to `prod` and use the `mix run` task.

```
MIX_ENV=prod iex -S mix run
```

## Developer Notes
To run GitInspect locally using the development configuration, run the following command:

```
iex -S mix run
```

## Testing
GitInspect includes both unit and integration tests.

To run the unit tests, run the following command:

```
iex -S mix test.watch
```

To run the integration tests, run the following command:

```
iex -S mix test --only github_api
```

A personal access token for the Github API is required to run the integration tests.

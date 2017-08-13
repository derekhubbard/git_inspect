defmodule GitInspect.Github.GithubClient do
  use HTTPoison.Base

  @endpoint Application.get_env(:git_inspect, :github_endpoint)
  @auth_token Application.get_env(:git_inspect, :github_auth_token)

  def process_request_headers(headers) do
    headers ++ ["Authorization": "bearer #{@auth_token}"]
  end

  def process_url(url), do: @endpoint <> url

  def process_response_body(""), do: nil
  def process_response_body(body), do: JSX.decode!(body)

  def process_response(%HTTPoison.Response{status_code: 200, body: body}), do: body
  def process_response(%HTTPoison.Response{status_code: status_code, body: body }), do: { status_code, body }
end

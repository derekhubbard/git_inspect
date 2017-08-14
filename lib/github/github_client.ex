defmodule GitInspect.Github.GithubClient do
  use HTTPoison.Base
  require Logger

  @endpoint Application.get_env(:git_inspect, :github_endpoint)
  @auth_token Application.get_env(:git_inspect, :github_auth_token)

  def get(url, headers \\ [], options \\ []) do
    resp = request!(:get, url, "", headers, options)

    case process_response(resp) do
      result when is_tuple(result) -> result
      _ -> paginate(resp)
    end
  end

  def process_request_headers(headers) do
    headers = headers ++ ["Authorization": "bearer #{@auth_token}"]
    # Logger.debug fn -> "headers: #{inspect(headers)}" end
    headers
  end

  def process_url(url), do: @endpoint <> url

  def process_response_body(""), do: nil
  def process_response_body(body), do: JSX.decode!(body)

  def process_response(%HTTPoison.Response{status_code: 200, body: body}), do: body
  def process_response(%HTTPoison.Response{status_code: status_code, body: body }), do: { status_code, body }

  defp paginate(%HTTPoison.Response{headers: headers, body: body} = resp) do
    Logger.debug inspect(headers)
    # case headers |> Keyword.hasKey?("Link") do
    #   true -> do_paginate(resp, Keyword.)
    # end
    case links = headers |> Keyword.get(:Link) do
      nil -> body
      _ -> do_paginate(resp, links)
    end
  end

  defp do_paginate(resp, links) do
    Logger.debug "paginating..."
    Logger.debug inspect(links)
  end
end

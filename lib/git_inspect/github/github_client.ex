defmodule GitInspect.Github.GithubClient do
  use HTTPoison.Base
  require Logger

  @endpoint Application.get_env(:git_inspect, :github_endpoint)
  @auth_token Application.get_env(:git_inspect, :github_auth_token)

  def get(url, headers \\ [], options \\ []) do
    response = request!(:get, build_url(url), "", headers, options)

    case process_response(response) do
      result when is_tuple(response) -> result
      _ -> paginate_response(response, [])
    end
  end

  defp build_url(url), do: @endpoint <> url

  defp paginate_response(%HTTPoison.Response{headers: headers, body: body}, results) do
    headers
    |> Enum.reduce(nil, &(extract_link_header(&1, &2)))
    |> case do
      nil -> body
      value -> do_paginate_response(ExLinkHeader.parse!(value), results ++ body)
    end
  end

  defp extract_link_header(header_tuple, current_val) do
    case elem(header_tuple, 0) == "Link" do
      true -> elem(header_tuple, 1)
      false -> current_val
    end
  end

  defp do_paginate_response(%ExLinkHeader{next: nil}, results), do: results
  defp do_paginate_response(%ExLinkHeader{next: %ExLinkHeaderEntry{ url: next_url }}, results) do
    request!(:get, next_url)
    |> paginate_response(results)
  end

  def process_request_headers(headers), do:  headers ++ ["Authorization": "bearer #{@auth_token}"]

  def process_response_body(""), do: nil
  def process_response_body(body), do: JSX.decode!(body, [{:labels, :atom}])

  def process_response(%HTTPoison.Response{status_code: 200, body: body}), do: body
  def process_response(%HTTPoison.Response{status_code: status_code, body: body }), do: { status_code, body }
end

defmodule GitInspect.Github.PullRequestsIntegrationTest do
  use ExUnit.Case
  alias GitInspect.Github.GithubClient

  @moduletag :github_api

  test "list retrieves pull requests from github" do
    user = "octocat"
    repo = "Hello-World"

    params = [{:state, "all"}]
    results = GithubClient.get("repos/#{user}/#{repo}/pulls", [], [params: params])

    assert is_list(results)
    assert length(results) > 0

    pull_request_schema = get_schema()
    |> ExJsonSchema.Schema.resolve

    results
    |> Enum.each(&(assert ExJsonSchema.Validator.validate(pull_request_schema, &1) == :ok))

    IO.puts "Pull requests retrieved: #{length(results)}"
  end

  defp get_schema() do
    %{
      "type" => "object",
      "required" => [
        "id",
        "url",
        "html_url",
        "diff_url",
        "patch_url",
        "issue_url",
        "commits_url",
        "review_comments_url",
        "review_comment_url",
        "comments_url",
        "statuses_url",
        "number",
        "state",
        "title",
        "body",
        "assignee",
        "milestone",
        "locked",
        "created_at",
        "updated_at",
        "closed_at",
        "merged_at",
        "head",
        "base",
        "_links",
        "user"
      ],
      "properties" => %{
        "id" => %{ "type" => "number"},
        "url" => %{ "type" => "string"},
        "html_url" => %{ "type" => "string"},
        "diff_url" => %{ "type" => "string"},
        "patch_url" => %{ "type" => "string"},
        "issue_url" => %{ "type" => "string"},
        "commits_url" => %{ "type" => "string"},
        "review_comments_url" => %{ "type" => "string"},
        "review_comment_url" => %{ "type" => "string"},
        "comments_url" => %{ "type" => "string"},
        "statuses_url" => %{ "type" => "string"},
        "number" => %{ "type" => "number"},
        "state" => %{ "type" => "string"},
        "title" => %{ "type" => "string"},
        "body" => %{ "anyOf" => [%{ "type" => "string"}, %{ "type" => "null" }]},
        "assignee" => %{
          "anyOf" => [
            %{
              "type" => "object",
              "required" => [
                "login",
                "id",
                "avatar_url",
                "gravatar_url",
                "gravatar_id",
                "url",
                "html_url",
                "followers_url",
                "following_url",
                "gists_url",
                "starred_url",
                "subscriptions_url",
                "organizations_url",
                "repos_url",
                "events_url",
                "received_events_url",
                "type",
                "site_admin"
              ],
              "properties" => %{
                "login" => %{ "type" => "string"},
                "id" => %{ "type" => "number"},
                "avatar_url" => %{ "type" => "string"},
                "gravatar_url" => %{ "type" => "string"},
                "url" => %{ "type" => "string"},
                "html_url" => %{ "type" => "string"},
                "followers_url" => %{ "type" => "string"},
                "following_url" => %{ "type" => "string"},
                "gists_url" => %{ "type" => "string"},
                "starred_url" => %{ "type" => "string"},
                "subscriptions_url" => %{ "type" => "string"},
                "organizations_url" => %{ "type" => "string"},
                "repos_url" => %{ "type" => "string"},
                "events_url" => %{ "type" => "string"},
                "received_events_url" => %{ "type" => "string"},
                "type" => %{ "type" => "string"},
                "site_admin" => %{ "type" => "string"}
              }
            },
            %{ "type" => "null" }]},
        "milestone" => %{
          "anyOf" => [
            %{
              "type" => "object",
              "required" => [
                "url",
                "html_url",
                "labels_url",
                "id",
                "number",
                "state",
                "title",
                "description",
                "creator",
                "open_issues",
                "closed_issues",
                "created_at",
                "updated_at",
                "closed_at",
                "due_on"
              ],
              "properties" => %{
                "url" => %{ "type" => "string"},
                "html_url" => %{ "type" => "string"},
                "labels_url" => %{ "type" => "string"},
                "id" => %{ "type" => "number"},
                "state" => %{ "type" => "string"},
                "title" => %{ "type" => "string"},
                "description" => %{ "type" => "string"},
                "creator" => %{ "type" => "object"},
                "open_issues" => %{ "type" => "number"},
                "closed_issues" => %{ "type" => "number"},
                "created_at" => %{ "format" => "date-time"},
                "updated_at" => %{ "format" => "date-time"},
                "closed_at" => %{ "format" => "date-time"},
                "due_on" => %{ "format" => "date-time"},
              }
            },
            %{ "type" => "null" }
          ]
        },
        "locked" => %{ "type" => "boolean"},
        "created_at" => %{ "format" => "date-time"},
        "updated_at" => %{ "format" => "date-time"},
        "closed_at" => %{ "format" => "date-time"},
        "merged_at" => %{ "format" => "date-time"},
        "head" => %{
          "type" => "object",
          "required" => [
            "label",
            "ref",
            "sha",
            "user",
            "repo"
          ],
          "properties" => %{
            "label" => %{ "anyOf" => [%{ "type" => "string"}, %{ "type" => "null" }] },
            "ref" => %{ "type" => "string"},
            "sha" => %{ "type" => "string"},
            "user" => %{ "anyOf" => [%{ "type" => "object"}, %{ "type" => "null" }] },
            "repo" => %{ "anyOf" => [%{ "type" => "object"}, %{ "type" => "null" }] }
          }
        },
        "base" => %{ "type" => "object"},
        "_links" => %{ "type" => "object"},
        "user" => %{ "type" => "object"}
      }
    }
  end
end

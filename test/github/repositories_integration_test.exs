defmodule GitInspect.Github.RepositoriesIntegrationTest do
  use ExUnit.Case
  alias GitInspect.Github.GithubClient

  @moduletag :github_api

  test "list users retrieves repositories from github" do
    user = "octocat"

    results = GithubClient.get("users/#{user}/repos")

    assert is_list(results)
    assert length(results) > 0

    repo_schema = get_schema()
    |> ExJsonSchema.Schema.resolve
    
    results
    |> Enum.each(&(assert ExJsonSchema.Validator.validate(repo_schema, &1) == :ok))
  end

  defp get_schema() do
    %{
      "defintions" => %{
        "owner" => %{
          "type" => "object",
          "required" => [],
          "properties" => %{
            "login" => %{ "type" => "string" }
          }
        }
      },
      "type" => "object",
      "required" => [
        "id",
        "owner",
        "name",
        "full_name",
        "description",
        "private",
        "fork",
        "url",
        "html_url",
        "archive_url",
        "assignees_url",
        "blobs_url",
        "branches_url",
        "clone_url",
        "collaborators_url",
        "comments_url",
        "commits_url",
        "compare_url",
        "contents_url",
        "contributors_url",
        "deployments_url",
        "downloads_url",
        "events_url",
        "forks_url",
        "git_commits_url",
        "git_refs_url",
        "git_tags_url",
        "git_url",
        "hooks_url",
        "issue_comment_url",
        "issue_events_url",
        "issues_url",
        "keys_url",
        "labels_url",
        "languages_url",
        "merges_url",
        "milestones_url",
        "mirror_url",
        "notifications_url",
        "pulls_url",
        "releases_url",
        "ssh_url",
        "stargazers_url",
        "statuses_url",
        "subscribers_url",
        "subscription_url",
        "svn_url",
        "tags_url",
        "teams_url",
        "trees_url",
        "homepage",
        "language",
        "forks_count",
        "stargazers_count",
        "watchers_count",
        "size",
        "default_branch",
        "open_issues_count",
        # "topics",
        "has_issues",
        "has_wiki",
        "has_pages",
        "has_downloads",
        "pushed_at",
        "created_at",
        "updated_at",
        "permissions"
        # "allow_rebase_merge",
        # "allow_squash_merge",
        # "allow_merge_commit",
        # "subscribers_count",
        # "network_count"
      ],
      "properties" => %{
        "id" => %{ "type" => "number" },
        "owner" => %{
          "type" => "object",
          "properties" => %{
            "login" => %{ "type" => "string" },
            "id" => %{ "type" => "number" },
            "avatar_url" => %{ "type" => "string" },
            "gravatar_id" => %{ "type" => "string" },
            "url" => %{ "type" => "string" },
            "html_url" => %{ "type" => "string" },
            "followers_url" => %{ "type" => "string" },
            "following_url" => %{ "type" => "string" },
            "gists_url" => %{ "type" => "string" },
            "starred_url" => %{ "type" => "string" },
            "subscriptions_url" => %{ "type" => "string" },
            "organizations_url" => %{ "type" => "string" },
            "repos_url" => %{ "type" => "string" },
            "events_url" => %{ "type" => "string" },
            "received_events_url" => %{ "type" => "string" },
            "type" => %{ "type" => "string" },
            "site_admin" => %{ "type" => "boolean" }
          }
        },
        "name" => %{ "type" => "string" },
        "full_name" => %{ "type" => "string" },
        "description" => %{ "anyOf" => [%{ "type" => "string" }, %{ "type" => "null" }]},
        "private" => %{ "type" => "boolean" },
        "fork" => %{ "type" => "boolean" },
        "url" => %{ "type" => "string" },
        "html_url" => %{ "type" => "string" },
        "archive_url" => %{ "type" => "string" },
        "assignees_url" => %{ "type" => "string" },
        "blobs_url" => %{ "type" => "string" },
        "branches_url" => %{ "type" => "string" },
        "clone_url" => %{ "type" => "string" },
        "collaborators_url" => %{ "type" => "string" },
        "comments_url" => %{ "type" => "string" },
        "commits_url" => %{ "type" => "string" },
        "compare_url" => %{ "type" => "string" },
        "contents_url" => %{ "type" => "string" },
        "contributors_url" => %{ "type" => "string" },
        "deployments_url" => %{ "type" => "string" },
        "downloads_url" => %{ "type" => "string" },
        "events_url" => %{ "type" => "string" },
        "forks_url" => %{ "type" => "string" },
        "git_commits_url" => %{ "type" => "string" },
        "git_refs_url" => %{ "type" => "string" },
        "git_tags_url" => %{ "type" => "string" },
        "git_url" => %{ "type" => "string" },
        "hooks_url" => %{ "type" => "string" },
        "issue_comment_url" => %{ "type" => "string" },
        "issue_events_url" => %{ "type" => "string" },
        "issues_url" => %{ "type" => "string" },
        "keys_url" => %{ "type" => "string" },
        "labels_url" => %{ "type" => "string" },
        "languages_url" => %{ "type" => "string" },
        "merges_url" => %{ "type" => "string" },
        "milestones_url" => %{ "type" => "string" },
        "mirror_url" => %{ "anyOf" => [%{ "type" => "string" }, %{ "type" => "null" }]},
        "notifications_url" => %{ "type" => "string" },
        "pulls_url" => %{ "type" => "string" },
        "releases_url" => %{ "type" => "string" },
        "ssh_url" => %{ "type" => "string" },
        "stargazers_url" => %{ "type" => "string" },
        "statuses_url" => %{ "type" => "string" },
        "subscribers_url" => %{ "type" => "string" },
        "subscription_url" => %{ "type" => "string" },
        "svn_url" => %{ "type" => "string" },
        "tags_url" => %{ "type" => "string" },
        "teams_url" => %{ "type" => "string" },
        "trees_url" => %{ "type" => "string" },
        "homepage" => %{ "anyOf" => [%{ "type" => "string" }, %{ "type" => "null" }]},
        "language" => %{ "anyOf" => [%{ "type" => "string" }, %{ "type" => "null" }]},
        "forks_count" => %{ "type" => "number" },
        "stargazers_count" => %{ "type" => "number" },
        "watchers_count" => %{ "type" => "number" },
        "size" => %{ "type" => "number" },
        "default_branch" => %{ "type" => "string" },
        "open_issues_count" => %{ "type" => "number" },
        "topics" => %{ "type" => "array" },
        "has_issues" => %{ "type" => "boolean" },
        "has_wiki" => %{ "type" => "boolean" },
        "has_pages" => %{ "type" => "boolean" },
        "has_downloads" => %{ "type" => "boolean" },
        "pushed_at" => %{ "format" => "date-time" },
        "created_at" => %{ "format" => "date-time" },
        "updated_at" => %{ "format" => "date-time" },
        "permissions" => %{ "type" => "object" },
        "allow_rebase_merge" => %{ "type" => "boolean" },
        "allow_squash_merge" => %{ "type" => "boolean" },
        "allow_merge_commit" => %{ "type" => "boolean" },
        "subscribers_count" => %{ "type" => "number" },
        "network_count" => %{ "type" => "number" }
      }
    }
  end
end

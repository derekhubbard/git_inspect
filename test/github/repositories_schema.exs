defmodule GitInspect.Github.RepositoriesSchema do
  def schema do
    %{
      "type" => "object",
      "required" => ["id", "name"]
      "properties" => %{
        "id" => %{ "type" => "string" },
        "name" => %{ "name" => "string" }
      }
    } |> ExJsonSchema.Schema.resolve
  end
end

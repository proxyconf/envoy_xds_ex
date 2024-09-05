defmodule Envoy.Admin.V3.UnreadyTargetsDumps.UnreadyTargetsDump do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :name, 1, type: :string
  field :target_names, 2, repeated: true, type: :string, json_name: "targetNames"
end

defmodule Envoy.Admin.V3.UnreadyTargetsDumps do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :unready_targets_dumps, 1,
    repeated: true,
    type: Envoy.Admin.V3.UnreadyTargetsDumps.UnreadyTargetsDump,
    json_name: "unreadyTargetsDumps"
end
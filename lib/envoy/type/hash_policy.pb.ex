defmodule Envoy.Type.HashPolicy.SourceIp do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Envoy.Type.HashPolicy do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :policy_specifier, 0

  field :source_ip, 1, type: Envoy.Type.HashPolicy.SourceIp, json_name: "sourceIp", oneof: 0
end
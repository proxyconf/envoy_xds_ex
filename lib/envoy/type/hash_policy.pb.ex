defmodule Envoy.Type.HashPolicy.SourceIp do
  @moduledoc """
  The source IP will be used to compute the hash used by hash-based load balancing
  algorithms.
  """

  use Protobuf,
    full_name: "envoy.type.HashPolicy.SourceIp",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Envoy.Type.HashPolicy do
  @moduledoc """
  Specifies the hash policy
  [#protodoc-title: Hash Policy]
  """

  use Protobuf,
    full_name: "envoy.type.HashPolicy",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :policy_specifier, 0

  field :source_ip, 1, type: Envoy.Type.HashPolicy.SourceIp, json_name: "sourceIp", oneof: 0
end

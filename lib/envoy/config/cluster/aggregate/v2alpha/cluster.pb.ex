defmodule Envoy.Config.Cluster.Aggregate.V2alpha.ClusterConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :clusters, 1, repeated: true, type: :string, deprecated: false
end
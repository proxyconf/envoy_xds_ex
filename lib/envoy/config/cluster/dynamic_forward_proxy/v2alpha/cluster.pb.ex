defmodule Envoy.Config.Cluster.DynamicForwardProxy.V2alpha.ClusterConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :dns_cache_config, 1,
    type: Envoy.Config.Common.DynamicForwardProxy.V2alpha.DnsCacheConfig,
    json_name: "dnsCacheConfig",
    deprecated: false
end
defmodule Envoy.Extensions.Network.DnsResolver.Apple.V3.AppleDnsResolverConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :include_unroutable_families, 1, type: :bool, json_name: "includeUnroutableFamilies"
end
defmodule Envoy.Extensions.Network.DnsResolver.Apple.V3.AppleDnsResolverConfig do
  @moduledoc """
  Configuration for apple DNS resolver.
  [#protodoc-title: apple DNS resolver]
  [#extension: envoy.network.dns_resolver.apple]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :include_unroutable_families, 1, type: :bool, json_name: "includeUnroutableFamilies"
end

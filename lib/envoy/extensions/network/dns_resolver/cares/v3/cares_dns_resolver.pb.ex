defmodule Envoy.Extensions.Network.DnsResolver.Cares.V3.CaresDnsResolverConfig do
  @moduledoc """
  Configuration for c-ares DNS resolver.
  [#next-free-field: 9]
  [#protodoc-title: c-ares DNS resolver]
  [#extension: envoy.network.dns_resolver.cares]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :resolvers, 1, repeated: true, type: Envoy.Config.Core.V3.Address
  field :use_resolvers_as_fallback, 3, type: :bool, json_name: "useResolversAsFallback"
  field :filter_unroutable_families, 4, type: :bool, json_name: "filterUnroutableFamilies"

  field :dns_resolver_options, 2,
    type: Envoy.Config.Core.V3.DnsResolverOptions,
    json_name: "dnsResolverOptions"

  field :udp_max_queries, 5, type: Google.Protobuf.UInt32Value, json_name: "udpMaxQueries"

  field :query_timeout_seconds, 6,
    type: Google.Protobuf.UInt64Value,
    json_name: "queryTimeoutSeconds",
    deprecated: false

  field :query_tries, 7,
    type: Google.Protobuf.UInt32Value,
    json_name: "queryTries",
    deprecated: false

  field :rotate_nameservers, 8, type: :bool, json_name: "rotateNameservers"
end

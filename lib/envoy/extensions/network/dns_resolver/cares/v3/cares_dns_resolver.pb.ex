defmodule Envoy.Extensions.Network.DnsResolver.Cares.V3.CaresDnsResolverConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :resolvers, 1, repeated: true, type: Envoy.Config.Core.V3.Address, deprecated: false
  field :use_resolvers_as_fallback, 3, type: :bool, json_name: "useResolversAsFallback"
  field :filter_unroutable_families, 4, type: :bool, json_name: "filterUnroutableFamilies"

  field :dns_resolver_options, 2,
    type: Envoy.Config.Core.V3.DnsResolverOptions,
    json_name: "dnsResolverOptions"

  field :udp_max_queries, 5, type: Google.Protobuf.UInt32Value, json_name: "udpMaxQueries"
end
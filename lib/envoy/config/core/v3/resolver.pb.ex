defmodule Envoy.Config.Core.V3.DnsResolverOptions do
  @moduledoc """
  Configuration of DNS resolver option flags which control the behavior of the DNS resolver.
  [#protodoc-title: Resolver]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :use_tcp_for_dns_lookups, 1, type: :bool, json_name: "useTcpForDnsLookups"
  field :no_default_search_domain, 2, type: :bool, json_name: "noDefaultSearchDomain"
end

defmodule Envoy.Config.Core.V3.DnsResolutionConfig do
  @moduledoc """
  DNS resolution configuration which includes the underlying dns resolver addresses and options.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :resolvers, 1, repeated: true, type: Envoy.Config.Core.V3.Address, deprecated: false

  field :dns_resolver_options, 2,
    type: Envoy.Config.Core.V3.DnsResolverOptions,
    json_name: "dnsResolverOptions"
end

defmodule Envoy.Extensions.Network.DnsResolver.Getaddrinfo.V3.GetAddrInfoDnsResolverConfig do
  @moduledoc """
  Configuration for getaddrinfo DNS resolver. This resolver will use the system's getaddrinfo()
  function to resolve hosts.

  .. attention::

    Resolutions currently use a hard coded TTL of 60s because the getaddrinfo() API does not
    provide the actual TTL. Configuration for this can be added in the future if needed.
  [#protodoc-title: getaddrinfo DNS resolver]
  [#extension: envoy.network.dns_resolver.getaddrinfo]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.network.dns_resolver.getaddrinfo.v3.GetAddrInfoDnsResolverConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :num_retries, 1, type: Google.Protobuf.UInt32Value, json_name: "numRetries"

  field :num_resolver_threads, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "numResolverThreads"
end

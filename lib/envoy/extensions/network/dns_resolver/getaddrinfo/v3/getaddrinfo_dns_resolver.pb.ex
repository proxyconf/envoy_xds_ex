defmodule Envoy.Extensions.Network.DnsResolver.Getaddrinfo.V3.GetAddrInfoDnsResolverConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :num_retries, 1, type: Google.Protobuf.UInt32Value, json_name: "numRetries"
end
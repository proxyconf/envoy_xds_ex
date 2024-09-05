defmodule Envoy.Extensions.TransportSockets.Http11Proxy.V3.Http11ProxyUpstreamTransport do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :transport_socket, 1,
    type: Envoy.Config.Core.V3.TransportSocket,
    json_name: "transportSocket",
    deprecated: false
end
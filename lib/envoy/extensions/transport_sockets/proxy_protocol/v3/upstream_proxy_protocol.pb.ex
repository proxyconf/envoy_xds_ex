defmodule Envoy.Extensions.TransportSockets.ProxyProtocol.V3.ProxyProtocolUpstreamTransport do
  @moduledoc """
  Configuration for PROXY protocol socket
  [#protodoc-title: Upstream Proxy Protocol]
  [#extension: envoy.transport_sockets.upstream_proxy_protocol]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :config, 1, type: Envoy.Config.Core.V3.ProxyProtocolConfig

  field :transport_socket, 2,
    type: Envoy.Config.Core.V3.TransportSocket,
    json_name: "transportSocket",
    deprecated: false

  field :allow_unspecified_address, 3, type: :bool, json_name: "allowUnspecifiedAddress"
  field :tlv_as_pool_key, 4, type: :bool, json_name: "tlvAsPoolKey"
end

defmodule Envoy.Extensions.TransportSockets.Quic.V3.QuicDownstreamTransport do
  @moduledoc """
  Configuration for Downstream QUIC transport socket. This provides Google's implementation of Google QUIC and IETF QUIC to Envoy.
  [#protodoc-title: quic transport]
  [#comment:#extension: envoy.transport_sockets.quic]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :downstream_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext,
    json_name: "downstreamTlsContext",
    deprecated: false

  field :enable_early_data, 2, type: Google.Protobuf.BoolValue, json_name: "enableEarlyData"
end

defmodule Envoy.Extensions.TransportSockets.Quic.V3.QuicUpstreamTransport do
  @moduledoc """
  Configuration for Upstream QUIC transport socket. This provides Google's implementation of Google QUIC and IETF QUIC to Envoy.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :upstream_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.UpstreamTlsContext,
    json_name: "upstreamTlsContext",
    deprecated: false
end

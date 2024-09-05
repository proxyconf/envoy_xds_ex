defmodule Envoy.Extensions.TransportSockets.Quic.V3.QuicDownstreamTransport do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :downstream_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext,
    json_name: "downstreamTlsContext",
    deprecated: false

  field :enable_early_data, 2, type: Google.Protobuf.BoolValue, json_name: "enableEarlyData"
end

defmodule Envoy.Extensions.TransportSockets.Quic.V3.QuicUpstreamTransport do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :upstream_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.UpstreamTlsContext,
    json_name: "upstreamTlsContext",
    deprecated: false
end
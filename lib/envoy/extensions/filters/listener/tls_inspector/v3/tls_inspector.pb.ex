defmodule Envoy.Extensions.Filters.Listener.TlsInspector.V3.TlsInspector do
  @moduledoc """
  [#next-free-field: 6]
  [#protodoc-title: TLS Inspector Filter]
  Allows detecting whether the transport appears to be TLS or plaintext.
  [#extension: envoy.filters.listener.tls_inspector]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.listener.tls_inspector.v3.TlsInspector",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :enable_ja3_fingerprinting, 1,
    type: Google.Protobuf.BoolValue,
    json_name: "enableJa3Fingerprinting"

  field :enable_ja4_fingerprinting, 3,
    type: Google.Protobuf.BoolValue,
    json_name: "enableJa4Fingerprinting"

  field :initial_read_buffer_size, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "initialReadBufferSize",
    deprecated: false

  field :close_connection_on_client_hello_parsing_errors, 4,
    type: :bool,
    json_name: "closeConnectionOnClientHelloParsingErrors"

  field :max_client_hello_size, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxClientHelloSize",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Listener.TlsInspector.V3.TlsInspector do
  @moduledoc """
  [#protodoc-title: TLS Inspector Filter]
  Allows detecting whether the transport appears to be TLS or plaintext.
  [#extension: envoy.filters.listener.tls_inspector]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :enable_ja3_fingerprinting, 1,
    type: Google.Protobuf.BoolValue,
    json_name: "enableJa3Fingerprinting"

  field :initial_read_buffer_size, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "initialReadBufferSize",
    deprecated: false
end

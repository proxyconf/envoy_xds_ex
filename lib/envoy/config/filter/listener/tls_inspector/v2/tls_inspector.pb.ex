defmodule Envoy.Config.Filter.Listener.TlsInspector.V2.TlsInspector do
  @moduledoc """
  [#protodoc-title: TLS Inspector Filter]
  Allows detecting whether the transport appears to be TLS or plaintext.
  [#extension: envoy.filters.listener.tls_inspector]
  """

  use Protobuf,
    full_name: "envoy.config.filter.listener.tls_inspector.v2.TlsInspector",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

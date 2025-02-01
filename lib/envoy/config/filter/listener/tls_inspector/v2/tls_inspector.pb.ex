defmodule Envoy.Config.Filter.Listener.TlsInspector.V2.TlsInspector do
  @moduledoc """
  [#protodoc-title: TLS Inspector Filter]
  Allows detecting whether the transport appears to be TLS or plaintext.
  [#extension: envoy.filters.listener.tls_inspector]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

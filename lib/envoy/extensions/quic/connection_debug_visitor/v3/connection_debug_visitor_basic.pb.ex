defmodule Envoy.Extensions.Quic.ConnectionDebugVisitor.V3.BasicConfig do
  @moduledoc """
  Configuration for a basic QUIC connection debug visitor.
  [#protodoc-title: QUIC connection debug visitor basic config]
  [#extension: envoy.quic.connection_debug_visitor.basic]
  """

  use Protobuf,
    full_name: "envoy.extensions.quic.connection_debug_visitor.v3.BasicConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

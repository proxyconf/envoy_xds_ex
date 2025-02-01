defmodule Envoy.Extensions.Quic.ConnectionDebugVisitor.QuicStats.V3.Config do
  @moduledoc """
  Configuration for a QUIC debug visitor which emits stats from the underlying QUIC transport.
  [#protodoc-title: QUIC stats config]
  [#extension: envoy.quic.connection_debug_visitor.quic_stats]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :update_period, 2,
    type: Google.Protobuf.Duration,
    json_name: "updatePeriod",
    deprecated: false
end

defmodule Envoy.Extensions.TransportSockets.TcpStats.V3.Config do
  @moduledoc """
  Configuration for the TCP Stats transport socket wrapper, which wraps another transport socket for
  all communication, but emits stats about the underlying TCP connection.

  The stats are documented :ref:`here <config_listener_stats_tcp>` for listeners and
  :ref:`here <config_cluster_manager_cluster_stats_tcp>` for clusters.

  This transport socket is currently only supported on Linux.
  [#protodoc-title: TCP Stats Transport Socket wrapper]
  [#extension: envoy.transport_sockets.tcp_stats]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :transport_socket, 1,
    type: Envoy.Config.Core.V3.TransportSocket,
    json_name: "transportSocket",
    deprecated: false

  field :update_period, 2,
    type: Google.Protobuf.Duration,
    json_name: "updatePeriod",
    deprecated: false
end

defmodule Envoy.Extensions.ResourceMonitors.DownstreamConnections.V3.DownstreamConnectionsConfig do
  @moduledoc """
  The downstream connections resource monitor tracks the global number of open downstream connections.
  [#protodoc-title: Downstream connections]
  [#extension: envoy.resource_monitors.global_downstream_max_connections]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :max_active_downstream_connections, 1,
    type: :int64,
    json_name: "maxActiveDownstreamConnections",
    deprecated: false
end

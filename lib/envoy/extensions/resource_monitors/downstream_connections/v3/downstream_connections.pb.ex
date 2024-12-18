defmodule Envoy.Extensions.ResourceMonitors.DownstreamConnections.V3.DownstreamConnectionsConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :max_active_downstream_connections, 1,
    type: :int64,
    json_name: "maxActiveDownstreamConnections",
    deprecated: false
end
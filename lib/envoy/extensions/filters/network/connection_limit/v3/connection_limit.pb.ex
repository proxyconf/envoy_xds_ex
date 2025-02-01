defmodule Envoy.Extensions.Filters.Network.ConnectionLimit.V3.ConnectionLimit do
  @moduledoc """
  [#protodoc-title: Connection limit]
  Connection limit :ref:`configuration overview <config_network_filters_connection_limit>`.
  [#extension: envoy.filters.network.connection_limit]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :max_connections, 2,
    type: Google.Protobuf.UInt64Value,
    json_name: "maxConnections",
    deprecated: false

  field :delay, 3, type: Google.Protobuf.Duration

  field :runtime_enabled, 4,
    type: Envoy.Config.Core.V3.RuntimeFeatureFlag,
    json_name: "runtimeEnabled"
end

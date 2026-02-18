defmodule Envoy.Extensions.Filters.Network.ReverseTunnel.V3.Validation do
  @moduledoc """
  Validation configuration for reverse tunnel identifiers.
  Validates the node ID and cluster ID extracted from reverse tunnel handshake headers
  against expected values specified using format strings.
  [#protodoc-title: Reverse Tunnel Network Filter]
  Reverse Tunnel Network Filter :ref:`configuration overview <config_network_filters_reverse_tunnel>`.
  [#extension: envoy.filters.network.reverse_tunnel]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.reverse_tunnel.v3.Validation",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :node_id_format, 1, type: :string, json_name: "nodeIdFormat", deprecated: false
  field :cluster_id_format, 2, type: :string, json_name: "clusterIdFormat", deprecated: false
  field :emit_dynamic_metadata, 3, type: :bool, json_name: "emitDynamicMetadata"

  field :dynamic_metadata_namespace, 4,
    type: :string,
    json_name: "dynamicMetadataNamespace",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.ReverseTunnel.V3.ReverseTunnel do
  @moduledoc """
  Configuration for the reverse tunnel network filter.
  This filter handles reverse tunnel connection acceptance and rejection by processing
  HTTP requests where required identification values are provided via HTTP headers.
  [#next-free-field: 7]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.reverse_tunnel.v3.ReverseTunnel",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :ping_interval, 1,
    type: Google.Protobuf.Duration,
    json_name: "pingInterval",
    deprecated: false

  field :auto_close_connections, 2, type: :bool, json_name: "autoCloseConnections"
  field :request_path, 3, type: :string, json_name: "requestPath", deprecated: false

  field :request_method, 4,
    type: Envoy.Config.Core.V3.RequestMethod,
    json_name: "requestMethod",
    enum: true,
    deprecated: false

  field :validation, 5, type: Envoy.Extensions.Filters.Network.ReverseTunnel.V3.Validation

  field :required_cluster_name, 6,
    type: :string,
    json_name: "requiredClusterName",
    deprecated: false
end

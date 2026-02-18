defmodule Envoy.Extensions.Bootstrap.ReverseTunnel.UpstreamSocketInterface.V3.UpstreamReverseConnectionSocketInterface do
  @moduledoc """
  Configuration for the upstream reverse connection socket interface.
  [#protodoc-title: Upstream reverse connection socket interface]
  [#extension: envoy.bootstrap.reverse_tunnel.upstream_socket_interface]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.bootstrap.reverse_tunnel.upstream_socket_interface.v3.UpstreamReverseConnectionSocketInterface",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix"

  field :ping_failure_threshold, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "pingFailureThreshold",
    deprecated: false

  field :enable_detailed_stats, 3, type: :bool, json_name: "enableDetailedStats"

  field :reporter_config, 4,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "reporterConfig"
end

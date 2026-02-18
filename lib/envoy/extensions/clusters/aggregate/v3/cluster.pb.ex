defmodule Envoy.Extensions.Clusters.Aggregate.V3.ClusterConfig do
  @moduledoc """
  Configuration for the aggregate cluster. See the :ref:`architecture overview
  <arch_overview_aggregate_cluster>` for more information.
  [#extension: envoy.clusters.aggregate]
  [#protodoc-title: Aggregate cluster configuration]
  """

  use Protobuf,
    full_name: "envoy.extensions.clusters.aggregate.v3.ClusterConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :clusters, 1, repeated: true, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Clusters.Aggregate.V3.AggregateClusterResource do
  @moduledoc """
  Configures an aggregate cluster whose
  :ref:`ClusterConfig <envoy_v3_api_msg_extensions.clusters.aggregate.v3.ClusterConfig>`
  is to be fetched from a separate xDS resource.
  [#extension: envoy.clusters.aggregate_resource]
  [#not-implemented-hide:]
  """

  use Protobuf,
    full_name: "envoy.extensions.clusters.aggregate.v3.AggregateClusterResource",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :config_source, 1,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "configSource",
    deprecated: false

  field :resource_name, 2, type: :string, json_name: "resourceName", deprecated: false
end

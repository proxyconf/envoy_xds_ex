defmodule Envoy.Config.Cluster.Aggregate.V2alpha.ClusterConfig do
  @moduledoc """
  Configuration for the aggregate cluster. See the :ref:`architecture overview
  <arch_overview_aggregate_cluster>` for more information.
  [#extension: envoy.clusters.aggregate]
  [#protodoc-title: Aggregate cluster configuration]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :clusters, 1, repeated: true, type: :string, deprecated: false
end

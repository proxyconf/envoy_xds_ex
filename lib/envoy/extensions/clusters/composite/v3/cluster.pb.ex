defmodule Envoy.Extensions.Clusters.Composite.V3.ClusterConfig.ClusterEntry do
  @moduledoc """
  Configuration for an individual cluster entry.
  """

  use Protobuf,
    full_name: "envoy.extensions.clusters.composite.v3.ClusterConfig.ClusterEntry",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Clusters.Composite.V3.ClusterConfig do
  @moduledoc """
  Configuration for the composite cluster. See the :ref:`architecture overview
  <arch_overview_composite_cluster>` for more information. This cluster type enables retry-aware
  cluster selection, allowing different retry attempts to automatically target
  different upstream clusters. Unlike the standard aggregate cluster which uses
  health-based selection, the composite cluster uses the retry attempt count to
  deterministically select which sub-cluster to route to.

  When retry attempts exceed the number of configured clusters, requests will fail with no
  host available.

  Example configuration:

  .. code-block:: yaml

      name: composite_cluster
      connect_timeout: 0.25s
      lb_policy: CLUSTER_PROVIDED
      cluster_type:
        name: envoy.clusters.composite
        typed_config:
          "@type": type.googleapis.com/envoy.extensions.clusters.composite.v3.ClusterConfig
          clusters:
          - name: primary_cluster
          - name: secondary_cluster
          - name: fallback_cluster

  [#extension: envoy.clusters.composite]
  [#protodoc-title: Composite cluster configuration]
  """

  use Protobuf,
    full_name: "envoy.extensions.clusters.composite.v3.ClusterConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :clusters, 1,
    repeated: true,
    type: Envoy.Extensions.Clusters.Composite.V3.ClusterConfig.ClusterEntry,
    deprecated: false
end

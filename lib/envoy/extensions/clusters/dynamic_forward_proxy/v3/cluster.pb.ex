defmodule Envoy.Extensions.Clusters.DynamicForwardProxy.V3.ClusterConfig do
  @moduledoc """
  Configuration for the dynamic forward proxy cluster. See the :ref:`architecture overview
  <arch_overview_http_dynamic_forward_proxy>` for more information.
  [#extension: envoy.clusters.dynamic_forward_proxy]
  [#protodoc-title: Dynamic forward proxy cluster configuration]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :cluster_implementation_specifier, 0

  field :dns_cache_config, 1,
    type: Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheConfig,
    json_name: "dnsCacheConfig",
    oneof: 0

  field :sub_clusters_config, 4,
    type: Envoy.Extensions.Clusters.DynamicForwardProxy.V3.SubClustersConfig,
    json_name: "subClustersConfig",
    oneof: 0

  field :allow_insecure_cluster_options, 2, type: :bool, json_name: "allowInsecureClusterOptions"
  field :allow_coalesced_connections, 3, type: :bool, json_name: "allowCoalescedConnections"
end

defmodule Envoy.Extensions.Clusters.DynamicForwardProxy.V3.SubClustersConfig do
  @moduledoc """
  Configuration for sub clusters. Hard code STRICT_DNS cluster type now.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :lb_policy, 1,
    type: Envoy.Config.Cluster.V3.Cluster.LbPolicy,
    json_name: "lbPolicy",
    enum: true,
    deprecated: false

  field :max_sub_clusters, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxSubClusters",
    deprecated: false

  field :sub_cluster_ttl, 3,
    type: Google.Protobuf.Duration,
    json_name: "subClusterTtl",
    deprecated: false

  field :preresolve_clusters, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.SocketAddress,
    json_name: "preresolveClusters"
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.WeightedCluster.ClusterWeight do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :weight, 2, type: :uint32, deprecated: false
  field :metadata_match, 3, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataMatch"
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.WeightedCluster do
  @moduledoc """
  Allows for specification of multiple upstream clusters along with weights
  that indicate the percentage of traffic to be forwarded to each cluster.
  The router selects an upstream cluster based on these weights.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :clusters, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.WeightedCluster.ClusterWeight,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.TunnelingConfig do
  @moduledoc """
  Configuration for tunneling TCP over other transports or application layers.
  Tunneling is supported over both HTTP/1.1 and HTTP/2. Upstream protocol is
  determined by the cluster configuration.
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :hostname, 1, type: :string, deprecated: false
  field :use_post, 2, type: :bool, json_name: "usePost"

  field :headers_to_add, 3,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "headersToAdd",
    deprecated: false

  field :propagate_response_headers, 4, type: :bool, json_name: "propagateResponseHeaders"
  field :post_path, 5, type: :string, json_name: "postPath"
  field :propagate_response_trailers, 6, type: :bool, json_name: "propagateResponseTrailers"
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.OnDemand do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :odcds_config, 1, type: Envoy.Config.Core.V3.ConfigSource, json_name: "odcdsConfig"
  field :resources_locator, 2, type: :string, json_name: "resourcesLocator"
  field :timeout, 3, type: Google.Protobuf.Duration
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.TcpAccessLogOptions do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :access_log_flush_interval, 1,
    type: Google.Protobuf.Duration,
    json_name: "accessLogFlushInterval",
    deprecated: false

  field :flush_access_log_on_connected, 2, type: :bool, json_name: "flushAccessLogOnConnected"
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy do
  @moduledoc """
  [#next-free-field: 19]
  [#protodoc-title: TCP Proxy]
  TCP Proxy :ref:`configuration overview <config_network_filters_tcp_proxy>`.
  [#extension: envoy.filters.network.tcp_proxy]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :cluster_specifier, 0

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :cluster, 2, type: :string, oneof: 0

  field :weighted_clusters, 10,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.WeightedCluster,
    json_name: "weightedClusters",
    oneof: 0

  field :on_demand, 14,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.OnDemand,
    json_name: "onDemand"

  field :metadata_match, 9, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataMatch"
  field :idle_timeout, 8, type: Google.Protobuf.Duration, json_name: "idleTimeout"

  field :downstream_idle_timeout, 3,
    type: Google.Protobuf.Duration,
    json_name: "downstreamIdleTimeout"

  field :upstream_idle_timeout, 4,
    type: Google.Protobuf.Duration,
    json_name: "upstreamIdleTimeout"

  field :access_log, 5,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "accessLog"

  field :max_connect_attempts, 7,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConnectAttempts",
    deprecated: false

  field :backoff_options, 18,
    type: Envoy.Config.Core.V3.BackoffStrategy,
    json_name: "backoffOptions"

  field :hash_policy, 11,
    repeated: true,
    type: Envoy.Type.V3.HashPolicy,
    json_name: "hashPolicy",
    deprecated: false

  field :tunneling_config, 12,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.TunnelingConfig,
    json_name: "tunnelingConfig"

  field :max_downstream_connection_duration, 13,
    type: Google.Protobuf.Duration,
    json_name: "maxDownstreamConnectionDuration",
    deprecated: false

  field :access_log_flush_interval, 15,
    type: Google.Protobuf.Duration,
    json_name: "accessLogFlushInterval",
    deprecated: true

  field :flush_access_log_on_connected, 16,
    type: :bool,
    json_name: "flushAccessLogOnConnected",
    deprecated: true

  field :access_log_options, 17,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.TcpAccessLogOptions,
    json_name: "accessLogOptions"
end

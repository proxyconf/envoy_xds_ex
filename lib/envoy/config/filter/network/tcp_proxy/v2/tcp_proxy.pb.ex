defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.DeprecatedV1.TCPRoute do
  @moduledoc """
  A TCP proxy route consists of a set of optional L4 criteria and the
  name of a cluster. If a downstream connection matches all the
  specified criteria, the cluster in the route is used for the
  corresponding upstream connection. Routes are tried in the order
  specified until a match is found. If no match is found, the connection
  is closed. A route with no criteria is valid and always produces a
  match.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cluster, 1, type: :string, deprecated: false

  field :destination_ip_list, 2,
    repeated: true,
    type: Envoy.Api.V2.Core.CidrRange,
    json_name: "destinationIpList"

  field :destination_ports, 3, type: :string, json_name: "destinationPorts"

  field :source_ip_list, 4,
    repeated: true,
    type: Envoy.Api.V2.Core.CidrRange,
    json_name: "sourceIpList"

  field :source_ports, 5, type: :string, json_name: "sourcePorts"
end

defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.DeprecatedV1 do
  @moduledoc """
  [#not-implemented-hide:] Deprecated.
  TCP Proxy filter configuration using V1 format.
  """

  use Protobuf, deprecated: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :routes, 1,
    repeated: true,
    type: Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.DeprecatedV1.TCPRoute,
    deprecated: false
end

defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.WeightedCluster.ClusterWeight do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :weight, 2, type: :uint32, deprecated: false
  field :metadata_match, 3, type: Envoy.Api.V2.Core.Metadata, json_name: "metadataMatch"
end

defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.WeightedCluster do
  @moduledoc """
  Allows for specification of multiple upstream clusters along with weights
  that indicate the percentage of traffic to be forwarded to each cluster.
  The router selects an upstream cluster based on these weights.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :clusters, 1,
    repeated: true,
    type: Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.WeightedCluster.ClusterWeight,
    deprecated: false
end

defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.TunnelingConfig do
  @moduledoc """
  Configuration for tunneling TCP over other transports or application layers.
  Currently, only HTTP/2 is supported. When other options exist, HTTP/2 will
  remain the default.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :hostname, 1, type: :string, deprecated: false
end

defmodule Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy do
  @moduledoc """
  [#next-free-field: 13]
  [#protodoc-title: TCP Proxy]
  TCP Proxy :ref:`configuration overview <config_network_filters_tcp_proxy>`.
  [#extension: envoy.filters.network.tcp_proxy]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :cluster_specifier, 0

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :cluster, 2, type: :string, oneof: 0

  field :weighted_clusters, 10,
    type: Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.WeightedCluster,
    json_name: "weightedClusters",
    oneof: 0

  field :metadata_match, 9, type: Envoy.Api.V2.Core.Metadata, json_name: "metadataMatch"
  field :idle_timeout, 8, type: Google.Protobuf.Duration, json_name: "idleTimeout"

  field :downstream_idle_timeout, 3,
    type: Google.Protobuf.Duration,
    json_name: "downstreamIdleTimeout"

  field :upstream_idle_timeout, 4,
    type: Google.Protobuf.Duration,
    json_name: "upstreamIdleTimeout"

  field :access_log, 5,
    repeated: true,
    type: Envoy.Config.Filter.Accesslog.V2.AccessLog,
    json_name: "accessLog"

  field :deprecated_v1, 6,
    type: Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.DeprecatedV1,
    json_name: "deprecatedV1",
    deprecated: true

  field :max_connect_attempts, 7,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConnectAttempts",
    deprecated: false

  field :hash_policy, 11,
    repeated: true,
    type: Envoy.Type.HashPolicy,
    json_name: "hashPolicy",
    deprecated: false

  field :tunneling_config, 12,
    type: Envoy.Config.Filter.Network.TcpProxy.V2.TcpProxy.TunnelingConfig,
    json_name: "tunnelingConfig"
end

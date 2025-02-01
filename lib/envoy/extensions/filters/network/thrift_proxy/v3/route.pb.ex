defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V3.RouteConfiguration do
  @moduledoc """
  [#protodoc-title: Thrift Proxy Route Configuration]
  Thrift Proxy :ref:`configuration overview <config_network_filters_thrift_proxy>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string
  field :routes, 2, repeated: true, type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.Route
  field :validate_clusters, 3, type: Google.Protobuf.BoolValue, json_name: "validateClusters"
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V3.Route do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :match, 1,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.RouteMatch,
    deprecated: false

  field :route, 2,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.RouteAction,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V3.RouteMatch do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :match_specifier, 0

  field :method_name, 1, type: :string, json_name: "methodName", oneof: 0
  field :service_name, 2, type: :string, json_name: "serviceName", oneof: 0
  field :invert, 3, type: :bool
  field :headers, 4, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V3.RouteAction.RequestMirrorPolicy do
  @moduledoc """
  The router is capable of shadowing traffic from one cluster to another. The current
  implementation is "fire and forget," meaning Envoy will not wait for the shadow cluster to
  respond before returning the response from the primary cluster. All normal statistics are
  collected for the shadow cluster making this feature useful for testing.

  .. note::

  Shadowing will not be triggered if the primary cluster does not exist.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cluster, 1, type: :string, deprecated: false

  field :runtime_fraction, 2,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "runtimeFraction"
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V3.RouteAction do
  @moduledoc """
  [#next-free-field: 8]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :cluster_specifier, 0

  field :cluster, 1, type: :string, oneof: 0, deprecated: false

  field :weighted_clusters, 2,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.WeightedCluster,
    json_name: "weightedClusters",
    oneof: 0

  field :cluster_header, 6, type: :string, json_name: "clusterHeader", oneof: 0, deprecated: false
  field :metadata_match, 3, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataMatch"

  field :rate_limits, 4,
    repeated: true,
    type: Envoy.Config.Route.V3.RateLimit,
    json_name: "rateLimits"

  field :strip_service_name, 5, type: :bool, json_name: "stripServiceName"

  field :request_mirror_policies, 7,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.RouteAction.RequestMirrorPolicy,
    json_name: "requestMirrorPolicies"
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V3.WeightedCluster.ClusterWeight do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :weight, 2, type: Google.Protobuf.UInt32Value, deprecated: false
  field :metadata_match, 3, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataMatch"
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.V3.WeightedCluster do
  @moduledoc """
  Allows for specification of multiple upstream clusters along with weights that indicate the
  percentage of traffic to be forwarded to each cluster. The router selects an upstream cluster
  based on these weights.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :clusters, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.WeightedCluster.ClusterWeight,
    deprecated: false
end

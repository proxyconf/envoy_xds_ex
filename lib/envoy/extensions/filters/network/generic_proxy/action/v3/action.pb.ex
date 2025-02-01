defmodule Envoy.Extensions.Filters.Network.GenericProxy.Action.V3.RouteAction.PerFilterConfigEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.Action.V3.RouteAction do
  @moduledoc """
  Configuration for the route match action.
  [#next-free-field: 8]
  [#protodoc-title: Generic Proxy Route Action Configuration]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :cluster_specifier, 0

  field :name, 5, type: :string
  field :cluster, 1, type: :string, oneof: 0

  field :weighted_clusters, 2,
    type: Envoy.Config.Route.V3.WeightedCluster,
    json_name: "weightedClusters",
    oneof: 0

  field :metadata, 3, type: Envoy.Config.Core.V3.Metadata

  field :per_filter_config, 4,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Network.GenericProxy.Action.V3.RouteAction.PerFilterConfigEntry,
    json_name: "perFilterConfig",
    map: true

  field :timeout, 6, type: Google.Protobuf.Duration
  field :retry_policy, 7, type: Envoy.Config.Core.V3.RetryPolicy, json_name: "retryPolicy"
end

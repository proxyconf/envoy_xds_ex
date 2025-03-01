defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.RouteConfiguration do
  @moduledoc """
  [#next-free-field: 6]
  [#protodoc-title: Dubbo Proxy Route Configuration]
  Dubbo Proxy :ref:`configuration overview <config_network_filters_dubbo_proxy>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string
  field :interface, 2, type: :string
  field :group, 3, type: :string
  field :version, 4, type: :string
  field :routes, 5, repeated: true, type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.Route
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.Route do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :match, 1,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.RouteMatch,
    deprecated: false

  field :route, 2,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.RouteAction,
    deprecated: false
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.RouteMatch do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :method, 1, type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.MethodMatch
  field :headers, 2, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.RouteAction do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :cluster_specifier, 0

  field :cluster, 1, type: :string, oneof: 0

  field :weighted_clusters, 2,
    type: Envoy.Api.V2.Route.WeightedCluster,
    json_name: "weightedClusters",
    oneof: 0
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.MethodMatch.ParameterMatchSpecifier do
  @moduledoc """
  The parameter matching type.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :parameter_match_specifier, 0

  field :exact_match, 3, type: :string, json_name: "exactMatch", oneof: 0
  field :range_match, 4, type: Envoy.Type.Int64Range, json_name: "rangeMatch", oneof: 0
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.MethodMatch.ParamsMatchEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :uint32

  field :value, 2,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.MethodMatch.ParameterMatchSpecifier
end

defmodule Envoy.Config.Filter.Network.DubboProxy.V2alpha1.MethodMatch do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: Envoy.Type.Matcher.StringMatcher

  field :params_match, 2,
    repeated: true,
    type: Envoy.Config.Filter.Network.DubboProxy.V2alpha1.MethodMatch.ParamsMatchEntry,
    json_name: "paramsMatch",
    map: true
end

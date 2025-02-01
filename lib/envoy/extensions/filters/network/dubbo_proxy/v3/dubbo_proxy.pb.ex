defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.ProtocolType do
  @moduledoc """
  Dubbo Protocol types supported by Envoy.
  [#protodoc-title: Dubbo Proxy]
  Dubbo Proxy :ref:`configuration overview <config_network_filters_dubbo_proxy>`.
  [#extension: envoy.filters.network.dubbo_proxy]
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :Dubbo, 0
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.SerializationType do
  @moduledoc """
  Dubbo Serialization types supported by Envoy.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :Hessian2, 0
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.Drds do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :config_source, 1,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "configSource",
    deprecated: false

  field :route_config_name, 2, type: :string, json_name: "routeConfigName"
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.DubboProxy do
  @moduledoc """
  [#next-free-field: 8]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :route_specifier, 0

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :protocol_type, 2,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.ProtocolType,
    json_name: "protocolType",
    enum: true,
    deprecated: false

  field :serialization_type, 3,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.SerializationType,
    json_name: "serializationType",
    enum: true,
    deprecated: false

  field :route_config, 4,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.RouteConfiguration,
    json_name: "routeConfig",
    deprecated: true

  field :drds, 6,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.Drds,
    oneof: 0,
    deprecated: false

  field :multiple_route_config, 7,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.MultipleRouteConfiguration,
    json_name: "multipleRouteConfig",
    oneof: 0

  field :dubbo_filters, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.DubboProxy.V3.DubboFilter,
    json_name: "dubboFilters"
end

defmodule Envoy.Extensions.Filters.Network.DubboProxy.V3.DubboFilter do
  @moduledoc """
  DubboFilter configures a Dubbo filter.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :config, 2, type: Google.Protobuf.Any
end

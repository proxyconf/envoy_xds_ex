defmodule Envoy.Api.V2.ScopedRouteConfiguration.Key.Fragment do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :type, 0

  field :string_key, 1, type: :string, json_name: "stringKey", oneof: 0
end

defmodule Envoy.Api.V2.ScopedRouteConfiguration.Key do
  @moduledoc """
  Specifies a key which is matched against the output of the
  :ref:`scope_key_builder<envoy_api_field_config.filter.network.http_connection_manager.v2.ScopedRoutes.scope_key_builder>`
  specified in the HttpConnectionManager. The matching is done per HTTP
  request and is dependent on the order of the fragments contained in the
  Key.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :fragments, 1,
    repeated: true,
    type: Envoy.Api.V2.ScopedRouteConfiguration.Key.Fragment,
    deprecated: false
end

defmodule Envoy.Api.V2.ScopedRouteConfiguration do
  @moduledoc """
  Specifies a routing scope, which associates a
  :ref:`Key<envoy_api_msg_ScopedRouteConfiguration.Key>` to a
  :ref:`envoy_api_msg_RouteConfiguration` (identified by its resource name).

  The HTTP connection manager builds up a table consisting of these Key to
  RouteConfiguration mappings, and looks up the RouteConfiguration to use per
  request according to the algorithm specified in the
  :ref:`scope_key_builder<envoy_api_field_config.filter.network.http_connection_manager.v2.ScopedRoutes.scope_key_builder>`
  assigned to the HttpConnectionManager.

  For example, with the following configurations (in YAML):

  HttpConnectionManager config:

  .. code::

  ...
  scoped_routes:
  name: foo-scoped-routes
  scope_key_builder:
  fragments:
  - header_value_extractor:
  name: X-Route-Selector
  element_separator: ","
  element:
  separator: =
  key: vip

  ScopedRouteConfiguration resources (specified statically via
  :ref:`scoped_route_configurations_list<envoy_api_field_config.filter.network.http_connection_manager.v2.ScopedRoutes.scoped_route_configurations_list>`
  or obtained dynamically via SRDS):

  .. code::

  (1)
  name: route-scope1
  route_configuration_name: route-config1
  key:
  fragments:
  - string_key: 172.10.10.20

  (2)
  name: route-scope2
  route_configuration_name: route-config2
  key:
  fragments:
  - string_key: 172.20.20.30

  A request from a client such as:

  .. code::

  GET / HTTP/1.1
  Host: foo.com
  X-Route-Selector: vip=172.10.10.20

  would result in the routing table defined by the `route-config1`
  RouteConfiguration being assigned to the HTTP request/stream.
  [#protodoc-title: HTTP scoped routing configuration]
  * Routing :ref:`architecture overview <arch_overview_http_routing>`
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false

  field :route_configuration_name, 2,
    type: :string,
    json_name: "routeConfigurationName",
    deprecated: false

  field :key, 3, type: Envoy.Api.V2.ScopedRouteConfiguration.Key, deprecated: false
end

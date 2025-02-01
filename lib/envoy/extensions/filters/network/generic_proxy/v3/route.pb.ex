defmodule Envoy.Extensions.Filters.Network.GenericProxy.V3.VirtualHost do
  @moduledoc """
  [#protodoc-title: Generic Proxy Route Configuration]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :hosts, 2, repeated: true, type: :string, deprecated: false
  field :routes, 3, type: Xds.Type.Matcher.V3.Matcher, deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.V3.RouteConfiguration do
  @moduledoc """
  The generic proxy makes use of the xDS matching API for routing configurations.

  In the below example, we combine a top level tree matcher with a linear matcher to match
  the incoming requests, and send the matching requests to v1 of the upstream service.

  .. code-block:: yaml

  name: example
  routes:
  matcher_tree:
  input:
  name: request-service
  typed_config:
  "@type": type.googleapis.com/envoy.extensions.filters.network.generic_proxy.matcher.v3.ServiceMatchInput
  exact_match_map:
  map:
  service_name_0:
  matcher:
  matcher_list:
  matchers:
  - predicate:
  and_matcher:
  predicate:
  - single_predicate:
  input:
  name: request-properties
  typed_config:
  "@type": type.googleapis.com/envoy.extensions.filters.network.generic_proxy.matcher.v3.PropertyMatchInput
  property_name: version
  value_match:
  exact: v1
  - single_predicate:
  input:
  name: request-properties
  typed_config:
  "@type": type.googleapis.com/envoy.extensions.filters.network.generic_proxy.matcher.v3.PropertyMatchInput
  property_name: user
  value_match:
  exact: john
  on_match:
  action:
  name: route
  typed_config:
  "@type": type.googleapis.com/envoy.extensions.filters.network.generic_proxy.action.v3.routeAction
  cluster: cluster_0
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :routes, 2, type: Xds.Type.Matcher.V3.Matcher

  field :virtual_hosts, 3,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.GenericProxy.V3.VirtualHost,
    json_name: "virtualHosts"
end

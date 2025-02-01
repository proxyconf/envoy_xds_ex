defmodule Envoy.Service.Route.V3.RdsDummy do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue with importing
  services: https://github.com/google/protobuf/issues/4221 and protoxform to upgrade the file.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.Route.V3.RouteDiscoveryService.Service do
  @moduledoc """
  The resource_names field in DiscoveryRequest specifies a route configuration.
  This allows an Envoy configuration with multiple HTTP listeners (and
  associated HTTP connection manager filters) to use different route
  configurations. Each listener will bind its HTTP connection manager filter to
  a route table via this identifier.
  [#protodoc-title: RDS]
  """

  use GRPC.Service,
    name: "envoy.service.route.v3.RouteDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamRoutes,
      stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DiscoveryResponse)

  rpc :DeltaRoutes,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)

  rpc :FetchRoutes,
      Envoy.Service.Discovery.V3.DiscoveryRequest,
      Envoy.Service.Discovery.V3.DiscoveryResponse
end

defmodule Envoy.Service.Route.V3.RouteDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Route.V3.RouteDiscoveryService.Service
end

defmodule Envoy.Service.Route.V3.VirtualHostDiscoveryService.Service do
  @moduledoc """
  Virtual Host Discovery Service (VHDS) is used to dynamically update the list of virtual hosts for
  a given RouteConfiguration. If VHDS is configured a virtual host list update will be triggered
  during the processing of an HTTP request if a route for the request cannot be resolved. The
  :ref:`resource_names_subscribe <envoy_v3_api_field_service.discovery.v3.DeltaDiscoveryRequest.resource_names_subscribe>`
  field contains a list of virtual host names or aliases to track. The contents of an alias would
  be the contents of a ``host`` or ``authority`` header used to make an http request. An xDS server
  will match an alias to a virtual host based on the content of :ref:`domains'
  <envoy_v3_api_field_config.route.v3.VirtualHost.domains>` field. The ``resource_names_unsubscribe`` field
  contains a list of virtual host names that have been :ref:`unsubscribed
  <xds_protocol_unsubscribe>` from the routing table associated with the RouteConfiguration.
  """

  use GRPC.Service,
    name: "envoy.service.route.v3.VirtualHostDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :DeltaVirtualHosts,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)
end

defmodule Envoy.Service.Route.V3.VirtualHostDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Route.V3.VirtualHostDiscoveryService.Service
end

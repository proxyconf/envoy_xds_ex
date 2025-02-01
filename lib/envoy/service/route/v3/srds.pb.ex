defmodule Envoy.Service.Route.V3.SrdsDummy do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue with importing
  services: https://github.com/google/protobuf/issues/4221 and protoxform to upgrade the file.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.Route.V3.ScopedRoutesDiscoveryService.Service do
  @moduledoc """
  The Scoped Routes Discovery Service (SRDS) API distributes
  :ref:`ScopedRouteConfiguration<envoy_v3_api_msg.ScopedRouteConfiguration>`
  resources. Each ScopedRouteConfiguration resource represents a "routing
  scope" containing a mapping that allows the HTTP connection manager to
  dynamically assign a routing table (specified via a
  :ref:`RouteConfiguration<envoy_v3_api_msg_config.route.v3.RouteConfiguration>` message) to each
  HTTP request.
  [#protodoc-title: SRDS]
  * Routing :ref:`architecture overview <arch_overview_http_routing>`
  """

  use GRPC.Service,
    name: "envoy.service.route.v3.ScopedRoutesDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamScopedRoutes,
      stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DiscoveryResponse)

  rpc :DeltaScopedRoutes,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)

  rpc :FetchScopedRoutes,
      Envoy.Service.Discovery.V3.DiscoveryRequest,
      Envoy.Service.Discovery.V3.DiscoveryResponse
end

defmodule Envoy.Service.Route.V3.ScopedRoutesDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Route.V3.ScopedRoutesDiscoveryService.Service
end

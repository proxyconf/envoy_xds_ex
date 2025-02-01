defmodule Envoy.Api.V2.SrdsDummy do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue with importing
  services: https://github.com/google/protobuf/issues/4221 and protoxform to upgrade the file.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Api.V2.ScopedRoutesDiscoveryService.Service do
  @moduledoc """
  The Scoped Routes Discovery Service (SRDS) API distributes
  :ref:`ScopedRouteConfiguration<envoy_api_msg.ScopedRouteConfiguration>`
  resources. Each ScopedRouteConfiguration resource represents a "routing
  scope" containing a mapping that allows the HTTP connection manager to
  dynamically assign a routing table (specified via a
  :ref:`RouteConfiguration<envoy_api_msg_RouteConfiguration>` message) to each
  HTTP request.
  [#protodoc-title: SRDS]
  * Routing :ref:`architecture overview <arch_overview_http_routing>`
  """

  use GRPC.Service,
    name: "envoy.api.v2.ScopedRoutesDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamScopedRoutes,
      stream(Envoy.Api.V2.DiscoveryRequest),
      stream(Envoy.Api.V2.DiscoveryResponse)

  rpc :DeltaScopedRoutes,
      stream(Envoy.Api.V2.DeltaDiscoveryRequest),
      stream(Envoy.Api.V2.DeltaDiscoveryResponse)

  rpc :FetchScopedRoutes, Envoy.Api.V2.DiscoveryRequest, Envoy.Api.V2.DiscoveryResponse
end

defmodule Envoy.Api.V2.ScopedRoutesDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Api.V2.ScopedRoutesDiscoveryService.Service
end

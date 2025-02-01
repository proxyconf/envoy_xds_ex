defmodule Envoy.Api.V2.EdsDummy do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue with importing
  services: https://github.com/google/protobuf/issues/4221 and protoxform to upgrade the file.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Api.V2.EndpointDiscoveryService.Service do
  @moduledoc """
  [#protodoc-title: EDS]
  Endpoint discovery :ref:`architecture overview <arch_overview_service_discovery_types_eds>`
  """

  use GRPC.Service,
    name: "envoy.api.v2.EndpointDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamEndpoints,
      stream(Envoy.Api.V2.DiscoveryRequest),
      stream(Envoy.Api.V2.DiscoveryResponse)

  rpc :DeltaEndpoints,
      stream(Envoy.Api.V2.DeltaDiscoveryRequest),
      stream(Envoy.Api.V2.DeltaDiscoveryResponse)

  rpc :FetchEndpoints, Envoy.Api.V2.DiscoveryRequest, Envoy.Api.V2.DiscoveryResponse
end

defmodule Envoy.Api.V2.EndpointDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Api.V2.EndpointDiscoveryService.Service
end

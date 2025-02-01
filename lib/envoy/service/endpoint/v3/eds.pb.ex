defmodule Envoy.Service.Endpoint.V3.EdsDummy do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue with importing
  services: https://github.com/google/protobuf/issues/4221 and protoxform to upgrade the file.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.Endpoint.V3.EndpointDiscoveryService.Service do
  @moduledoc """
  [#protodoc-title: EDS]
  Endpoint discovery :ref:`architecture overview <arch_overview_service_discovery_types_eds>`
  """

  use GRPC.Service,
    name: "envoy.service.endpoint.v3.EndpointDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamEndpoints,
      stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DiscoveryResponse)

  rpc :DeltaEndpoints,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)

  rpc :FetchEndpoints,
      Envoy.Service.Discovery.V3.DiscoveryRequest,
      Envoy.Service.Discovery.V3.DiscoveryResponse
end

defmodule Envoy.Service.Endpoint.V3.EndpointDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Endpoint.V3.EndpointDiscoveryService.Service
end

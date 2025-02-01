defmodule Envoy.Service.Endpoint.V3.LedsDummy do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue with importing
  services: https://github.com/google/protobuf/issues/4221 and protoxform to upgrade the file.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.Endpoint.V3.LocalityEndpointDiscoveryService.Service do
  @moduledoc """
  [#not-implemented-hide:]
  [#protodoc-title: LEDS]
  Locality-Endpoint discovery
  [#comment:TODO(adisuissa): Link to unified matching docs:
  :ref:`architecture overview<arch_overview_service_discovery_types_leds>`]
  """

  use GRPC.Service,
    name: "envoy.service.endpoint.v3.LocalityEndpointDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :DeltaLocalityEndpoints,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)
end

defmodule Envoy.Service.Endpoint.V3.LocalityEndpointDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Endpoint.V3.LocalityEndpointDiscoveryService.Service
end

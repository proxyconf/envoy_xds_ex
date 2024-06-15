defmodule Envoy.Service.Endpoint.V3.EdsDummy do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Envoy.Service.Endpoint.V3.EndpointDiscoveryService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "envoy.service.endpoint.v3.EndpointDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

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
  @moduledoc false

  use GRPC.Stub, service: Envoy.Service.Endpoint.V3.EndpointDiscoveryService.Service
end
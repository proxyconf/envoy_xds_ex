defmodule Envoy.Service.Discovery.V3.AdsDummy do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Envoy.Service.Discovery.V3.AggregatedDiscoveryService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "envoy.service.discovery.v3.AggregatedDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamAggregatedResources,
      stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DiscoveryResponse)

  rpc :DeltaAggregatedResources,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)
end

defmodule Envoy.Service.Discovery.V3.AggregatedDiscoveryService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Envoy.Service.Discovery.V3.AggregatedDiscoveryService.Service
end
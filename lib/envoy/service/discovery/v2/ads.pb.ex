defmodule Envoy.Service.Discovery.V2.AdsDummy do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue with importing
  services: https://github.com/google/protobuf/issues/4221
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.Discovery.V2.AggregatedDiscoveryService.Service do
  @moduledoc """
  See https://github.com/envoyproxy/envoy-api#apis for a description of the role of
  ADS and how it is intended to be used by a management server. ADS requests
  have the same structure as their singleton xDS counterparts, but can
  multiplex many resource types on a single stream. The type_url in the
  DiscoveryRequest/DiscoveryResponse provides sufficient information to recover
  the multiplexed singleton APIs at the Envoy instance and management server.
  [#protodoc-title: Aggregated Discovery Service (ADS)]
  Discovery services for endpoints, clusters, routes,
  and listeners are retained in the package `envoy.api.v2` for backwards
  compatibility with existing management servers. New development in discovery
  services should proceed in the package `envoy.service.discovery.v2`.
  """

  use GRPC.Service,
    name: "envoy.service.discovery.v2.AggregatedDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamAggregatedResources,
      stream(Envoy.Api.V2.DiscoveryRequest),
      stream(Envoy.Api.V2.DiscoveryResponse)

  rpc :DeltaAggregatedResources,
      stream(Envoy.Api.V2.DeltaDiscoveryRequest),
      stream(Envoy.Api.V2.DeltaDiscoveryResponse)
end

defmodule Envoy.Service.Discovery.V2.AggregatedDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Discovery.V2.AggregatedDiscoveryService.Service
end

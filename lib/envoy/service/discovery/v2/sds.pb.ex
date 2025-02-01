defmodule Envoy.Service.Discovery.V2.SdsDummy do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue with importing
  services: https://github.com/google/protobuf/issues/4221
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.Discovery.V2.SecretDiscoveryService.Service do
  @moduledoc """
  [#protodoc-title: Secret Discovery Service (SDS)]
  """

  use GRPC.Service,
    name: "envoy.service.discovery.v2.SecretDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :DeltaSecrets,
      stream(Envoy.Api.V2.DeltaDiscoveryRequest),
      stream(Envoy.Api.V2.DeltaDiscoveryResponse)

  rpc :StreamSecrets,
      stream(Envoy.Api.V2.DiscoveryRequest),
      stream(Envoy.Api.V2.DiscoveryResponse)

  rpc :FetchSecrets, Envoy.Api.V2.DiscoveryRequest, Envoy.Api.V2.DiscoveryResponse
end

defmodule Envoy.Service.Discovery.V2.SecretDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Discovery.V2.SecretDiscoveryService.Service
end

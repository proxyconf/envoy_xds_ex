defmodule Envoy.Service.Secret.V3.SdsDummy do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue with importing
  services: https://github.com/google/protobuf/issues/4221
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.Secret.V3.SecretDiscoveryService.Service do
  @moduledoc """
  [#protodoc-title: Secret Discovery Service (SDS)]
  """

  use GRPC.Service,
    name: "envoy.service.secret.v3.SecretDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :DeltaSecrets,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)

  rpc :StreamSecrets,
      stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DiscoveryResponse)

  rpc :FetchSecrets,
      Envoy.Service.Discovery.V3.DiscoveryRequest,
      Envoy.Service.Discovery.V3.DiscoveryResponse
end

defmodule Envoy.Service.Secret.V3.SecretDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Secret.V3.SecretDiscoveryService.Service
end

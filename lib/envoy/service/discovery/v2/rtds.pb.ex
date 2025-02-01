defmodule Envoy.Service.Discovery.V2.RtdsDummy do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue with importing
  services: https://github.com/google/protobuf/issues/4221
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.Discovery.V2.Runtime do
  @moduledoc """
  RTDS resource type. This describes a layer in the runtime virtual filesystem.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :layer, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Service.Discovery.V2.RuntimeDiscoveryService.Service do
  @moduledoc """
  Discovery service for Runtime resources.
  [#protodoc-title: Runtime Discovery Service (RTDS)]
  RTDS :ref:`configuration overview <config_runtime_rtds>`
  """

  use GRPC.Service,
    name: "envoy.service.discovery.v2.RuntimeDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamRuntime,
      stream(Envoy.Api.V2.DiscoveryRequest),
      stream(Envoy.Api.V2.DiscoveryResponse)

  rpc :DeltaRuntime,
      stream(Envoy.Api.V2.DeltaDiscoveryRequest),
      stream(Envoy.Api.V2.DeltaDiscoveryResponse)

  rpc :FetchRuntime, Envoy.Api.V2.DiscoveryRequest, Envoy.Api.V2.DiscoveryResponse
end

defmodule Envoy.Service.Discovery.V2.RuntimeDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Discovery.V2.RuntimeDiscoveryService.Service
end

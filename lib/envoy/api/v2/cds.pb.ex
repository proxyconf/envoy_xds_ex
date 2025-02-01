defmodule Envoy.Api.V2.CdsDummy do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue with importing
  services: https://github.com/google/protobuf/issues/4221 and protoxform to upgrade the file.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Api.V2.ClusterDiscoveryService.Service do
  @moduledoc """
  Return list of all clusters this proxy will load balance to.
  [#protodoc-title: CDS]
  """

  use GRPC.Service,
    name: "envoy.api.v2.ClusterDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamClusters,
      stream(Envoy.Api.V2.DiscoveryRequest),
      stream(Envoy.Api.V2.DiscoveryResponse)

  rpc :DeltaClusters,
      stream(Envoy.Api.V2.DeltaDiscoveryRequest),
      stream(Envoy.Api.V2.DeltaDiscoveryResponse)

  rpc :FetchClusters, Envoy.Api.V2.DiscoveryRequest, Envoy.Api.V2.DiscoveryResponse
end

defmodule Envoy.Api.V2.ClusterDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Api.V2.ClusterDiscoveryService.Service
end

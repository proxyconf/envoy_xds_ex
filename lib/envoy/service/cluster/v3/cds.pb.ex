defmodule Envoy.Service.Cluster.V3.CdsDummy do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue with importing
  services: https://github.com/google/protobuf/issues/4221 and protoxform to upgrade the file.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.Cluster.V3.ClusterDiscoveryService.Service do
  @moduledoc """
  Return list of all clusters this proxy will load balance to.
  [#protodoc-title: CDS]
  """

  use GRPC.Service,
    name: "envoy.service.cluster.v3.ClusterDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamClusters,
      stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DiscoveryResponse)

  rpc :DeltaClusters,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)

  rpc :FetchClusters,
      Envoy.Service.Discovery.V3.DiscoveryRequest,
      Envoy.Service.Discovery.V3.DiscoveryResponse
end

defmodule Envoy.Service.Cluster.V3.ClusterDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Cluster.V3.ClusterDiscoveryService.Service
end

defmodule Envoy.Service.Discovery.V2.Capability.Protocol do
  @moduledoc """
  Different Envoy instances may have different capabilities (e.g. Redis)
  and/or have ports enabled for different protocols.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :HTTP, 0
  field :TCP, 1
  field :REDIS, 2
end

defmodule Envoy.Service.Discovery.V2.Capability do
  @moduledoc """
  Defines supported protocols etc, so the management server can assign proper
  endpoints to healthcheck.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :health_check_protocols, 1,
    repeated: true,
    type: Envoy.Service.Discovery.V2.Capability.Protocol,
    json_name: "healthCheckProtocols",
    enum: true
end

defmodule Envoy.Service.Discovery.V2.HealthCheckRequest do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node, 1, type: Envoy.Api.V2.Core.Node
  field :capability, 2, type: Envoy.Service.Discovery.V2.Capability
end

defmodule Envoy.Service.Discovery.V2.EndpointHealth do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :endpoint, 1, type: Envoy.Api.V2.Endpoint.Endpoint

  field :health_status, 2,
    type: Envoy.Api.V2.Core.HealthStatus,
    json_name: "healthStatus",
    enum: true
end

defmodule Envoy.Service.Discovery.V2.EndpointHealthResponse do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :endpoints_health, 1,
    repeated: true,
    type: Envoy.Service.Discovery.V2.EndpointHealth,
    json_name: "endpointsHealth"
end

defmodule Envoy.Service.Discovery.V2.HealthCheckRequestOrEndpointHealthResponse do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :request_type, 0

  field :health_check_request, 1,
    type: Envoy.Service.Discovery.V2.HealthCheckRequest,
    json_name: "healthCheckRequest",
    oneof: 0

  field :endpoint_health_response, 2,
    type: Envoy.Service.Discovery.V2.EndpointHealthResponse,
    json_name: "endpointHealthResponse",
    oneof: 0
end

defmodule Envoy.Service.Discovery.V2.LocalityEndpoints do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :locality, 1, type: Envoy.Api.V2.Core.Locality
  field :endpoints, 2, repeated: true, type: Envoy.Api.V2.Endpoint.Endpoint
end

defmodule Envoy.Service.Discovery.V2.ClusterHealthCheck do
  @moduledoc """
  The cluster name and locality is provided to Envoy for the endpoints that it
  health checks to support statistics reporting, logging and debugging by the
  Envoy instance (outside of HDS). For maximum usefulness, it should match the
  same cluster structure as that provided by EDS.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cluster_name, 1, type: :string, json_name: "clusterName"

  field :health_checks, 2,
    repeated: true,
    type: Envoy.Api.V2.Core.HealthCheck,
    json_name: "healthChecks"

  field :locality_endpoints, 3,
    repeated: true,
    type: Envoy.Service.Discovery.V2.LocalityEndpoints,
    json_name: "localityEndpoints"
end

defmodule Envoy.Service.Discovery.V2.HealthCheckSpecifier do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cluster_health_checks, 1,
    repeated: true,
    type: Envoy.Service.Discovery.V2.ClusterHealthCheck,
    json_name: "clusterHealthChecks"

  field :interval, 2, type: Google.Protobuf.Duration
end

defmodule Envoy.Service.Discovery.V2.HealthDiscoveryService.Service do
  @moduledoc """
  HDS is Health Discovery Service. It compliments Envoy’s health checking
  service by designating this Envoy to be a healthchecker for a subset of hosts
  in the cluster. The status of these health checks will be reported to the
  management server, where it can be aggregated etc and redistributed back to
  Envoy through EDS.
  [#protodoc-title: Health Discovery Service (HDS)]
  """

  use GRPC.Service,
    name: "envoy.service.discovery.v2.HealthDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamHealthCheck,
      stream(Envoy.Service.Discovery.V2.HealthCheckRequestOrEndpointHealthResponse),
      stream(Envoy.Service.Discovery.V2.HealthCheckSpecifier)

  rpc :FetchHealthCheck,
      Envoy.Service.Discovery.V2.HealthCheckRequestOrEndpointHealthResponse,
      Envoy.Service.Discovery.V2.HealthCheckSpecifier
end

defmodule Envoy.Service.Discovery.V2.HealthDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Discovery.V2.HealthDiscoveryService.Service
end

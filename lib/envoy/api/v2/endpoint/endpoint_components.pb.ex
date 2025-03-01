defmodule Envoy.Api.V2.Endpoint.Endpoint.HealthCheckConfig do
  @moduledoc """
  The optional health check configuration.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :port_value, 1, type: :uint32, json_name: "portValue", deprecated: false
  field :hostname, 2, type: :string
end

defmodule Envoy.Api.V2.Endpoint.Endpoint do
  @moduledoc """
  Upstream host identifier.
  [#protodoc-title: Endpoints]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :address, 1, type: Envoy.Api.V2.Core.Address

  field :health_check_config, 2,
    type: Envoy.Api.V2.Endpoint.Endpoint.HealthCheckConfig,
    json_name: "healthCheckConfig"

  field :hostname, 3, type: :string
end

defmodule Envoy.Api.V2.Endpoint.LbEndpoint do
  @moduledoc """
  An Endpoint that Envoy can route traffic to.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :host_identifier, 0

  field :endpoint, 1, type: Envoy.Api.V2.Endpoint.Endpoint, oneof: 0
  field :endpoint_name, 5, type: :string, json_name: "endpointName", oneof: 0

  field :health_status, 2,
    type: Envoy.Api.V2.Core.HealthStatus,
    json_name: "healthStatus",
    enum: true

  field :metadata, 3, type: Envoy.Api.V2.Core.Metadata

  field :load_balancing_weight, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "loadBalancingWeight",
    deprecated: false
end

defmodule Envoy.Api.V2.Endpoint.LocalityLbEndpoints do
  @moduledoc """
  A group of endpoints belonging to a Locality.
  One can have multiple LocalityLbEndpoints for a locality, but this is
  generally only done if the different groups need to have different load
  balancing weights or different priorities.
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :locality, 1, type: Envoy.Api.V2.Core.Locality

  field :lb_endpoints, 2,
    repeated: true,
    type: Envoy.Api.V2.Endpoint.LbEndpoint,
    json_name: "lbEndpoints"

  field :load_balancing_weight, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "loadBalancingWeight",
    deprecated: false

  field :priority, 5, type: :uint32, deprecated: false
  field :proximity, 6, type: Google.Protobuf.UInt32Value
end

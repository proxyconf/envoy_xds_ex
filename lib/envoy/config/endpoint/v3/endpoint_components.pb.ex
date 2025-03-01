defmodule Envoy.Config.Endpoint.V3.Endpoint.HealthCheckConfig do
  @moduledoc """
  The optional health check configuration.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :port_value, 1, type: :uint32, json_name: "portValue", deprecated: false
  field :hostname, 2, type: :string
  field :address, 3, type: Envoy.Config.Core.V3.Address
  field :disable_active_health_check, 4, type: :bool, json_name: "disableActiveHealthCheck"
end

defmodule Envoy.Config.Endpoint.V3.Endpoint.AdditionalAddress do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :address, 1, type: Envoy.Config.Core.V3.Address
end

defmodule Envoy.Config.Endpoint.V3.Endpoint do
  @moduledoc """
  Upstream host identifier.
  [#protodoc-title: Endpoints]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :address, 1, type: Envoy.Config.Core.V3.Address

  field :health_check_config, 2,
    type: Envoy.Config.Endpoint.V3.Endpoint.HealthCheckConfig,
    json_name: "healthCheckConfig"

  field :hostname, 3, type: :string

  field :additional_addresses, 4,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.Endpoint.AdditionalAddress,
    json_name: "additionalAddresses"
end

defmodule Envoy.Config.Endpoint.V3.LbEndpoint do
  @moduledoc """
  An Endpoint that Envoy can route traffic to.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :host_identifier, 0

  field :endpoint, 1, type: Envoy.Config.Endpoint.V3.Endpoint, oneof: 0
  field :endpoint_name, 5, type: :string, json_name: "endpointName", oneof: 0

  field :health_status, 2,
    type: Envoy.Config.Core.V3.HealthStatus,
    json_name: "healthStatus",
    enum: true

  field :metadata, 3, type: Envoy.Config.Core.V3.Metadata

  field :load_balancing_weight, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "loadBalancingWeight",
    deprecated: false
end

defmodule Envoy.Config.Endpoint.V3.LedsClusterLocalityConfig do
  @moduledoc """
  [#not-implemented-hide:]
  A configuration for a LEDS collection.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :leds_config, 1, type: Envoy.Config.Core.V3.ConfigSource, json_name: "ledsConfig"
  field :leds_collection_name, 2, type: :string, json_name: "ledsCollectionName"
end

defmodule Envoy.Config.Endpoint.V3.LocalityLbEndpoints.LbEndpointList do
  @moduledoc """
  [#not-implemented-hide:]
  A list of endpoints of a specific locality.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :lb_endpoints, 1,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.LbEndpoint,
    json_name: "lbEndpoints"
end

defmodule Envoy.Config.Endpoint.V3.LocalityLbEndpoints do
  @moduledoc """
  A group of endpoints belonging to a Locality.
  One can have multiple LocalityLbEndpoints for a locality, but only if
  they have different priorities.
  [#next-free-field: 10]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :lb_config, 0

  field :locality, 1, type: Envoy.Config.Core.V3.Locality
  field :metadata, 9, type: Envoy.Config.Core.V3.Metadata

  field :lb_endpoints, 2,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.LbEndpoint,
    json_name: "lbEndpoints"

  field :load_balancer_endpoints, 7,
    type: Envoy.Config.Endpoint.V3.LocalityLbEndpoints.LbEndpointList,
    json_name: "loadBalancerEndpoints",
    oneof: 0

  field :leds_cluster_locality_config, 8,
    type: Envoy.Config.Endpoint.V3.LedsClusterLocalityConfig,
    json_name: "ledsClusterLocalityConfig",
    oneof: 0

  field :load_balancing_weight, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "loadBalancingWeight",
    deprecated: false

  field :priority, 5, type: :uint32, deprecated: false
  field :proximity, 6, type: Google.Protobuf.UInt32Value
end

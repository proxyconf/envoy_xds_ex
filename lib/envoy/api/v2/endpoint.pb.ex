defmodule Envoy.Api.V2.ClusterLoadAssignment.Policy.DropOverload do
  @moduledoc """
  [#not-implemented-hide:]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :category, 1, type: :string, deprecated: false
  field :drop_percentage, 2, type: Envoy.Type.FractionalPercent, json_name: "dropPercentage"
end

defmodule Envoy.Api.V2.ClusterLoadAssignment.Policy do
  @moduledoc """
  Load balancing policy settings.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :drop_overloads, 2,
    repeated: true,
    type: Envoy.Api.V2.ClusterLoadAssignment.Policy.DropOverload,
    json_name: "dropOverloads"

  field :overprovisioning_factor, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "overprovisioningFactor",
    deprecated: false

  field :endpoint_stale_after, 4,
    type: Google.Protobuf.Duration,
    json_name: "endpointStaleAfter",
    deprecated: false

  field :disable_overprovisioning, 5,
    type: :bool,
    json_name: "disableOverprovisioning",
    deprecated: true
end

defmodule Envoy.Api.V2.ClusterLoadAssignment.NamedEndpointsEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Api.V2.Endpoint.Endpoint
end

defmodule Envoy.Api.V2.ClusterLoadAssignment do
  @moduledoc """
  Each route from RDS will map to a single cluster or traffic split across
  clusters using weights expressed in the RDS WeightedCluster.

  With EDS, each cluster is treated independently from a LB perspective, with
  LB taking place between the Localities within a cluster and at a finer
  granularity between the hosts within a locality. The percentage of traffic
  for each endpoint is determined by both its load_balancing_weight, and the
  load_balancing_weight of its locality. First, a locality will be selected,
  then an endpoint within that locality will be chose based on its weight.
  [#next-free-field: 6]
  [#protodoc-title: Endpoint configuration]
  Endpoint discovery :ref:`architecture overview <arch_overview_service_discovery_types_eds>`
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cluster_name, 1, type: :string, json_name: "clusterName", deprecated: false
  field :endpoints, 2, repeated: true, type: Envoy.Api.V2.Endpoint.LocalityLbEndpoints

  field :named_endpoints, 5,
    repeated: true,
    type: Envoy.Api.V2.ClusterLoadAssignment.NamedEndpointsEntry,
    json_name: "namedEndpoints",
    map: true

  field :policy, 4, type: Envoy.Api.V2.ClusterLoadAssignment.Policy
end

defmodule Envoy.Config.Endpoint.V3.ClusterLoadAssignment.Policy.DropOverload do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :category, 1, type: :string, deprecated: false
  field :drop_percentage, 2, type: Envoy.Type.V3.FractionalPercent, json_name: "dropPercentage"
end

defmodule Envoy.Config.Endpoint.V3.ClusterLoadAssignment.Policy do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :drop_overloads, 2,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.ClusterLoadAssignment.Policy.DropOverload,
    json_name: "dropOverloads"

  field :overprovisioning_factor, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "overprovisioningFactor",
    deprecated: false

  field :endpoint_stale_after, 4,
    type: Google.Protobuf.Duration,
    json_name: "endpointStaleAfter",
    deprecated: false

  field :weighted_priority_health, 6, type: :bool, json_name: "weightedPriorityHealth"
end

defmodule Envoy.Config.Endpoint.V3.ClusterLoadAssignment.NamedEndpointsEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Config.Endpoint.V3.Endpoint
end

defmodule Envoy.Config.Endpoint.V3.ClusterLoadAssignment do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :cluster_name, 1, type: :string, json_name: "clusterName", deprecated: false
  field :endpoints, 2, repeated: true, type: Envoy.Config.Endpoint.V3.LocalityLbEndpoints

  field :named_endpoints, 5,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.ClusterLoadAssignment.NamedEndpointsEntry,
    json_name: "namedEndpoints",
    map: true

  field :policy, 4, type: Envoy.Config.Endpoint.V3.ClusterLoadAssignment.Policy
end
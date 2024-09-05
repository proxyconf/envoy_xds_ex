defmodule Envoy.Data.Cluster.V2alpha.OutlierEjectionType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :CONSECUTIVE_5XX, 0
  field :CONSECUTIVE_GATEWAY_FAILURE, 1
  field :SUCCESS_RATE, 2
  field :CONSECUTIVE_LOCAL_ORIGIN_FAILURE, 3
  field :SUCCESS_RATE_LOCAL_ORIGIN, 4
  field :FAILURE_PERCENTAGE, 5
  field :FAILURE_PERCENTAGE_LOCAL_ORIGIN, 6
end

defmodule Envoy.Data.Cluster.V2alpha.Action do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :EJECT, 0
  field :UNEJECT, 1
end

defmodule Envoy.Data.Cluster.V2alpha.OutlierDetectionEvent do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :event, 0

  field :type, 1,
    type: Envoy.Data.Cluster.V2alpha.OutlierEjectionType,
    enum: true,
    deprecated: false

  field :timestamp, 2, type: Google.Protobuf.Timestamp

  field :secs_since_last_action, 3,
    type: Google.Protobuf.UInt64Value,
    json_name: "secsSinceLastAction"

  field :cluster_name, 4, type: :string, json_name: "clusterName", deprecated: false
  field :upstream_url, 5, type: :string, json_name: "upstreamUrl", deprecated: false
  field :action, 6, type: Envoy.Data.Cluster.V2alpha.Action, enum: true, deprecated: false
  field :num_ejections, 7, type: :uint32, json_name: "numEjections"
  field :enforced, 8, type: :bool

  field :eject_success_rate_event, 9,
    type: Envoy.Data.Cluster.V2alpha.OutlierEjectSuccessRate,
    json_name: "ejectSuccessRateEvent",
    oneof: 0

  field :eject_consecutive_event, 10,
    type: Envoy.Data.Cluster.V2alpha.OutlierEjectConsecutive,
    json_name: "ejectConsecutiveEvent",
    oneof: 0

  field :eject_failure_percentage_event, 11,
    type: Envoy.Data.Cluster.V2alpha.OutlierEjectFailurePercentage,
    json_name: "ejectFailurePercentageEvent",
    oneof: 0
end

defmodule Envoy.Data.Cluster.V2alpha.OutlierEjectSuccessRate do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :host_success_rate, 1, type: :uint32, json_name: "hostSuccessRate", deprecated: false

  field :cluster_average_success_rate, 2,
    type: :uint32,
    json_name: "clusterAverageSuccessRate",
    deprecated: false

  field :cluster_success_rate_ejection_threshold, 3,
    type: :uint32,
    json_name: "clusterSuccessRateEjectionThreshold",
    deprecated: false
end

defmodule Envoy.Data.Cluster.V2alpha.OutlierEjectConsecutive do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Envoy.Data.Cluster.V2alpha.OutlierEjectFailurePercentage do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :host_success_rate, 1, type: :uint32, json_name: "hostSuccessRate", deprecated: false
end
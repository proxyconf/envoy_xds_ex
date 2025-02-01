defmodule Envoy.Admin.V2alpha.Clusters do
  @moduledoc """
  Admin endpoint uses this wrapper for `/clusters` to display cluster status information.
  See :ref:`/clusters <operations_admin_interface_clusters>` for more information.
  [#protodoc-title: Clusters]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cluster_statuses, 1,
    repeated: true,
    type: Envoy.Admin.V2alpha.ClusterStatus,
    json_name: "clusterStatuses"
end

defmodule Envoy.Admin.V2alpha.ClusterStatus do
  @moduledoc """
  Details an individual cluster's current status.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string
  field :added_via_api, 2, type: :bool, json_name: "addedViaApi"

  field :success_rate_ejection_threshold, 3,
    type: Envoy.Type.Percent,
    json_name: "successRateEjectionThreshold"

  field :host_statuses, 4,
    repeated: true,
    type: Envoy.Admin.V2alpha.HostStatus,
    json_name: "hostStatuses"

  field :local_origin_success_rate_ejection_threshold, 5,
    type: Envoy.Type.Percent,
    json_name: "localOriginSuccessRateEjectionThreshold"
end

defmodule Envoy.Admin.V2alpha.HostStatus do
  @moduledoc """
  Current state of a particular host.
  [#next-free-field: 10]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :address, 1, type: Envoy.Api.V2.Core.Address
  field :stats, 2, repeated: true, type: Envoy.Admin.V2alpha.SimpleMetric
  field :health_status, 3, type: Envoy.Admin.V2alpha.HostHealthStatus, json_name: "healthStatus"
  field :success_rate, 4, type: Envoy.Type.Percent, json_name: "successRate"
  field :weight, 5, type: :uint32
  field :hostname, 6, type: :string
  field :priority, 7, type: :uint32

  field :local_origin_success_rate, 8,
    type: Envoy.Type.Percent,
    json_name: "localOriginSuccessRate"

  field :locality, 9, type: Envoy.Api.V2.Core.Locality
end

defmodule Envoy.Admin.V2alpha.HostHealthStatus do
  @moduledoc """
  Health status for a host.
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :failed_active_health_check, 1, type: :bool, json_name: "failedActiveHealthCheck"
  field :failed_outlier_check, 2, type: :bool, json_name: "failedOutlierCheck"
  field :failed_active_degraded_check, 4, type: :bool, json_name: "failedActiveDegradedCheck"
  field :pending_dynamic_removal, 5, type: :bool, json_name: "pendingDynamicRemoval"
  field :pending_active_hc, 6, type: :bool, json_name: "pendingActiveHc"

  field :eds_health_status, 3,
    type: Envoy.Api.V2.Core.HealthStatus,
    json_name: "edsHealthStatus",
    enum: true
end

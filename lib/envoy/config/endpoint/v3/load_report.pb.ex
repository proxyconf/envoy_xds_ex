defmodule Envoy.Config.Endpoint.V3.UpstreamLocalityStats do
  @moduledoc """
  These are stats Envoy reports to the management server at a frequency defined by
  :ref:`LoadStatsResponse.load_reporting_interval<envoy_v3_api_field_service.load_stats.v3.LoadStatsResponse.load_reporting_interval>`.
  Stats per upstream region/zone and optionally per subzone.
  [#next-free-field: 15]
  [#protodoc-title: Load Report]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :locality, 1, type: Envoy.Config.Core.V3.Locality
  field :total_successful_requests, 2, type: :uint64, json_name: "totalSuccessfulRequests"
  field :total_requests_in_progress, 3, type: :uint64, json_name: "totalRequestsInProgress"
  field :total_error_requests, 4, type: :uint64, json_name: "totalErrorRequests"
  field :total_issued_requests, 8, type: :uint64, json_name: "totalIssuedRequests"

  field :total_active_connections, 9,
    type: :uint64,
    json_name: "totalActiveConnections",
    deprecated: false

  field :total_new_connections, 10,
    type: :uint64,
    json_name: "totalNewConnections",
    deprecated: false

  field :total_fail_connections, 11,
    type: :uint64,
    json_name: "totalFailConnections",
    deprecated: false

  field :cpu_utilization, 12,
    type: Envoy.Config.Endpoint.V3.UnnamedEndpointLoadMetricStats,
    json_name: "cpuUtilization"

  field :mem_utilization, 13,
    type: Envoy.Config.Endpoint.V3.UnnamedEndpointLoadMetricStats,
    json_name: "memUtilization"

  field :application_utilization, 14,
    type: Envoy.Config.Endpoint.V3.UnnamedEndpointLoadMetricStats,
    json_name: "applicationUtilization"

  field :load_metric_stats, 5,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.EndpointLoadMetricStats,
    json_name: "loadMetricStats"

  field :upstream_endpoint_stats, 7,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.UpstreamEndpointStats,
    json_name: "upstreamEndpointStats"

  field :priority, 6, type: :uint32
end

defmodule Envoy.Config.Endpoint.V3.UpstreamEndpointStats do
  @moduledoc """
  [#next-free-field: 8]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :address, 1, type: Envoy.Config.Core.V3.Address
  field :metadata, 6, type: Google.Protobuf.Struct
  field :total_successful_requests, 2, type: :uint64, json_name: "totalSuccessfulRequests"
  field :total_requests_in_progress, 3, type: :uint64, json_name: "totalRequestsInProgress"
  field :total_error_requests, 4, type: :uint64, json_name: "totalErrorRequests"
  field :total_issued_requests, 7, type: :uint64, json_name: "totalIssuedRequests"

  field :load_metric_stats, 5,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.EndpointLoadMetricStats,
    json_name: "loadMetricStats"
end

defmodule Envoy.Config.Endpoint.V3.EndpointLoadMetricStats do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :metric_name, 1, type: :string, json_name: "metricName"

  field :num_requests_finished_with_metric, 2,
    type: :uint64,
    json_name: "numRequestsFinishedWithMetric"

  field :total_metric_value, 3, type: :double, json_name: "totalMetricValue"
end

defmodule Envoy.Config.Endpoint.V3.UnnamedEndpointLoadMetricStats do
  @moduledoc """
  Same as EndpointLoadMetricStats, except without the metric_name field.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :num_requests_finished_with_metric, 1,
    type: :uint64,
    json_name: "numRequestsFinishedWithMetric"

  field :total_metric_value, 2, type: :double, json_name: "totalMetricValue"
end

defmodule Envoy.Config.Endpoint.V3.ClusterStats.DroppedRequests do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :category, 1, type: :string, deprecated: false
  field :dropped_count, 2, type: :uint64, json_name: "droppedCount"
end

defmodule Envoy.Config.Endpoint.V3.ClusterStats do
  @moduledoc """
  Per cluster load stats. Envoy reports these stats a management server in a
  :ref:`LoadStatsRequest<envoy_v3_api_msg_service.load_stats.v3.LoadStatsRequest>`
  Next ID: 7
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cluster_name, 1, type: :string, json_name: "clusterName", deprecated: false
  field :cluster_service_name, 6, type: :string, json_name: "clusterServiceName"

  field :upstream_locality_stats, 2,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.UpstreamLocalityStats,
    json_name: "upstreamLocalityStats",
    deprecated: false

  field :total_dropped_requests, 3, type: :uint64, json_name: "totalDroppedRequests"

  field :dropped_requests, 5,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.ClusterStats.DroppedRequests,
    json_name: "droppedRequests"

  field :load_report_interval, 4, type: Google.Protobuf.Duration, json_name: "loadReportInterval"
end

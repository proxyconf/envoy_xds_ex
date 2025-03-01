defmodule Envoy.Api.V2.Endpoint.UpstreamLocalityStats do
  @moduledoc """
  These are stats Envoy reports to GLB every so often. Report frequency is
  defined by
  :ref:`LoadStatsResponse.load_reporting_interval<envoy_api_field_service.load_stats.v2.LoadStatsResponse.load_reporting_interval>`.
  Stats per upstream region/zone and optionally per subzone.
  [#not-implemented-hide:] Not configuration. TBD how to doc proto APIs.
  [#next-free-field: 9]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :locality, 1, type: Envoy.Api.V2.Core.Locality
  field :total_successful_requests, 2, type: :uint64, json_name: "totalSuccessfulRequests"
  field :total_requests_in_progress, 3, type: :uint64, json_name: "totalRequestsInProgress"
  field :total_error_requests, 4, type: :uint64, json_name: "totalErrorRequests"
  field :total_issued_requests, 8, type: :uint64, json_name: "totalIssuedRequests"

  field :load_metric_stats, 5,
    repeated: true,
    type: Envoy.Api.V2.Endpoint.EndpointLoadMetricStats,
    json_name: "loadMetricStats"

  field :upstream_endpoint_stats, 7,
    repeated: true,
    type: Envoy.Api.V2.Endpoint.UpstreamEndpointStats,
    json_name: "upstreamEndpointStats"

  field :priority, 6, type: :uint32
end

defmodule Envoy.Api.V2.Endpoint.UpstreamEndpointStats do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. TBD how to doc proto APIs.
  [#next-free-field: 8]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :address, 1, type: Envoy.Api.V2.Core.Address
  field :metadata, 6, type: Google.Protobuf.Struct
  field :total_successful_requests, 2, type: :uint64, json_name: "totalSuccessfulRequests"
  field :total_requests_in_progress, 3, type: :uint64, json_name: "totalRequestsInProgress"
  field :total_error_requests, 4, type: :uint64, json_name: "totalErrorRequests"
  field :total_issued_requests, 7, type: :uint64, json_name: "totalIssuedRequests"

  field :load_metric_stats, 5,
    repeated: true,
    type: Envoy.Api.V2.Endpoint.EndpointLoadMetricStats,
    json_name: "loadMetricStats"
end

defmodule Envoy.Api.V2.Endpoint.EndpointLoadMetricStats do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. TBD how to doc proto APIs.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :metric_name, 1, type: :string, json_name: "metricName"

  field :num_requests_finished_with_metric, 2,
    type: :uint64,
    json_name: "numRequestsFinishedWithMetric"

  field :total_metric_value, 3, type: :double, json_name: "totalMetricValue"
end

defmodule Envoy.Api.V2.Endpoint.ClusterStats.DroppedRequests do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :category, 1, type: :string, deprecated: false
  field :dropped_count, 2, type: :uint64, json_name: "droppedCount"
end

defmodule Envoy.Api.V2.Endpoint.ClusterStats do
  @moduledoc """
  Per cluster load stats. Envoy reports these stats a management server in a
  :ref:`LoadStatsRequest<envoy_api_msg_service.load_stats.v2.LoadStatsRequest>`
  [#not-implemented-hide:] Not configuration. TBD how to doc proto APIs.
  Next ID: 7
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cluster_name, 1, type: :string, json_name: "clusterName", deprecated: false
  field :cluster_service_name, 6, type: :string, json_name: "clusterServiceName"

  field :upstream_locality_stats, 2,
    repeated: true,
    type: Envoy.Api.V2.Endpoint.UpstreamLocalityStats,
    json_name: "upstreamLocalityStats",
    deprecated: false

  field :total_dropped_requests, 3, type: :uint64, json_name: "totalDroppedRequests"

  field :dropped_requests, 5,
    repeated: true,
    type: Envoy.Api.V2.Endpoint.ClusterStats.DroppedRequests,
    json_name: "droppedRequests"

  field :load_report_interval, 4, type: Google.Protobuf.Duration, json_name: "loadReportInterval"
end

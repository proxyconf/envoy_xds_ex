defmodule Envoy.Service.LoadStats.V3.LoadStatsRequest do
  @moduledoc """
  A load report Envoy sends to the management server.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node, 1, type: Envoy.Config.Core.V3.Node

  field :cluster_stats, 2,
    repeated: true,
    type: Envoy.Config.Endpoint.V3.ClusterStats,
    json_name: "clusterStats"
end

defmodule Envoy.Service.LoadStats.V3.LoadStatsResponse do
  @moduledoc """
  The management server sends envoy a LoadStatsResponse with all clusters it
  is interested in learning load stats about.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :clusters, 1, repeated: true, type: :string
  field :send_all_clusters, 4, type: :bool, json_name: "sendAllClusters"

  field :load_reporting_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "loadReportingInterval"

  field :report_endpoint_granularity, 3, type: :bool, json_name: "reportEndpointGranularity"
end

defmodule Envoy.Service.LoadStats.V3.LoadReportingService.Service do
  @moduledoc """
  [#protodoc-title: Load reporting service (LRS)]
  Load Reporting Service is an Envoy API to emit load reports. Envoy will initiate a bi-directional
  stream with a management server. Upon connecting, the management server can send a
  :ref:`LoadStatsResponse <envoy_v3_api_msg_service.load_stats.v3.LoadStatsResponse>` to a node it is
  interested in getting the load reports for. Envoy in this node will start sending
  :ref:`LoadStatsRequest <envoy_v3_api_msg_service.load_stats.v3.LoadStatsRequest>`. This is done periodically
  based on the :ref:`load reporting interval <envoy_v3_api_field_service.load_stats.v3.LoadStatsResponse.load_reporting_interval>`
  For details, take a look at the :ref:`Load Reporting Service sandbox example <install_sandboxes_load_reporting_service>`.
  """

  use GRPC.Service,
    name: "envoy.service.load_stats.v3.LoadReportingService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamLoadStats,
      stream(Envoy.Service.LoadStats.V3.LoadStatsRequest),
      stream(Envoy.Service.LoadStats.V3.LoadStatsResponse)
end

defmodule Envoy.Service.LoadStats.V3.LoadReportingService.Stub do
  use GRPC.Stub, service: Envoy.Service.LoadStats.V3.LoadReportingService.Service
end

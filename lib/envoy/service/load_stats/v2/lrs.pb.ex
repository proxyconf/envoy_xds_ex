defmodule Envoy.Service.LoadStats.V2.LoadStatsRequest do
  @moduledoc """
  A load report Envoy sends to the management server.
  [#not-implemented-hide:] Not configuration. TBD how to doc proto APIs.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node, 1, type: Envoy.Api.V2.Core.Node

  field :cluster_stats, 2,
    repeated: true,
    type: Envoy.Api.V2.Endpoint.ClusterStats,
    json_name: "clusterStats"
end

defmodule Envoy.Service.LoadStats.V2.LoadStatsResponse do
  @moduledoc """
  The management server sends envoy a LoadStatsResponse with all clusters it
  is interested in learning load stats about.
  [#not-implemented-hide:] Not configuration. TBD how to doc proto APIs.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :clusters, 1, repeated: true, type: :string
  field :send_all_clusters, 4, type: :bool, json_name: "sendAllClusters"

  field :load_reporting_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "loadReportingInterval"

  field :report_endpoint_granularity, 3, type: :bool, json_name: "reportEndpointGranularity"
end

defmodule Envoy.Service.LoadStats.V2.LoadReportingService.Service do
  @moduledoc """
  [#protodoc-title: Load reporting service]
  """

  use GRPC.Service,
    name: "envoy.service.load_stats.v2.LoadReportingService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamLoadStats,
      stream(Envoy.Service.LoadStats.V2.LoadStatsRequest),
      stream(Envoy.Service.LoadStats.V2.LoadStatsResponse)
end

defmodule Envoy.Service.LoadStats.V2.LoadReportingService.Stub do
  use GRPC.Stub, service: Envoy.Service.LoadStats.V2.LoadReportingService.Service
end

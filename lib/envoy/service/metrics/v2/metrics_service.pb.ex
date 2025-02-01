defmodule Envoy.Service.Metrics.V2.StreamMetricsResponse do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.Metrics.V2.StreamMetricsMessage.Identifier do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node, 1, type: Envoy.Api.V2.Core.Node, deprecated: false
end

defmodule Envoy.Service.Metrics.V2.StreamMetricsMessage do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :identifier, 1, type: Envoy.Service.Metrics.V2.StreamMetricsMessage.Identifier

  field :envoy_metrics, 2,
    repeated: true,
    type: Io.Prometheus.Client.MetricFamily,
    json_name: "envoyMetrics"
end

defmodule Envoy.Service.Metrics.V2.MetricsService.Service do
  @moduledoc """
  Service for streaming metrics to server that consumes the metrics data. It uses Prometheus metric
  data model as a standard to represent metrics information.
  [#protodoc-title: Metrics service]
  """

  use GRPC.Service,
    name: "envoy.service.metrics.v2.MetricsService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamMetrics,
      stream(Envoy.Service.Metrics.V2.StreamMetricsMessage),
      Envoy.Service.Metrics.V2.StreamMetricsResponse
end

defmodule Envoy.Service.Metrics.V2.MetricsService.Stub do
  use GRPC.Stub, service: Envoy.Service.Metrics.V2.MetricsService.Service
end

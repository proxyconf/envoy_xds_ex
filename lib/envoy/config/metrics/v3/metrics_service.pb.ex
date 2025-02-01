defmodule Envoy.Config.Metrics.V3.HistogramEmitMode do
  @moduledoc """
  HistogramEmitMode is used to configure which metric types should be emitted for histograms.
  [#protodoc-title: Metrics service]
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :SUMMARY_AND_HISTOGRAM, 0
  field :SUMMARY, 1
  field :HISTOGRAM, 2
end

defmodule Envoy.Config.Metrics.V3.MetricsServiceConfig do
  @moduledoc """
  Metrics Service is configured as a built-in ``envoy.stat_sinks.metrics_service`` :ref:`StatsSink
  <envoy_v3_api_msg_config.metrics.v3.StatsSink>`. This opaque configuration will be used to create
  Metrics Service.

  Example:

  .. code-block:: yaml

  stats_sinks:
  - name: envoy.stat_sinks.metrics_service
  typed_config:
  "@type": type.googleapis.com/envoy.config.metrics.v3.MetricsServiceConfig

  [#extension: envoy.stat_sinks.metrics_service]
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :grpc_service, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    deprecated: false

  field :transport_api_version, 3,
    type: Envoy.Config.Core.V3.ApiVersion,
    json_name: "transportApiVersion",
    enum: true,
    deprecated: false

  field :report_counters_as_deltas, 2,
    type: Google.Protobuf.BoolValue,
    json_name: "reportCountersAsDeltas"

  field :emit_tags_as_labels, 4, type: :bool, json_name: "emitTagsAsLabels"

  field :histogram_emit_mode, 5,
    type: Envoy.Config.Metrics.V3.HistogramEmitMode,
    json_name: "histogramEmitMode",
    enum: true,
    deprecated: false
end

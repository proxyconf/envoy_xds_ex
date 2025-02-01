defmodule Envoy.Extensions.AccessLoggers.OpenTelemetry.V3.OpenTelemetryAccessLogConfig do
  @moduledoc """
  Configuration for the built-in ``envoy.access_loggers.open_telemetry``
  :ref:`AccessLog <envoy_v3_api_msg_config.accesslog.v3.AccessLog>`. This configuration will
  populate `opentelemetry.proto.collector.v1.logs.ExportLogsServiceRequest.resource_logs <https://github.com/open-telemetry/opentelemetry-proto/blob/main/opentelemetry/proto/collector/logs/v1/logs_service.proto>`_.
  In addition, the request start time is set in the dedicated field.
  [#extension: envoy.access_loggers.open_telemetry]
  [#next-free-field: 8]
  [#protodoc-title: OpenTelemetry (gRPC) Access Log]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :common_config, 1,
    type: Envoy.Extensions.AccessLoggers.Grpc.V3.CommonGrpcAccessLogConfig,
    json_name: "commonConfig",
    deprecated: false

  field :disable_builtin_labels, 5, type: :bool, json_name: "disableBuiltinLabels"

  field :resource_attributes, 4,
    type: Opentelemetry.Proto.Common.V1.KeyValueList,
    json_name: "resourceAttributes"

  field :body, 2, type: Opentelemetry.Proto.Common.V1.AnyValue
  field :attributes, 3, type: Opentelemetry.Proto.Common.V1.KeyValueList
  field :stat_prefix, 6, type: :string, json_name: "statPrefix"
  field :formatters, 7, repeated: true, type: Envoy.Config.Core.V3.TypedExtensionConfig
end

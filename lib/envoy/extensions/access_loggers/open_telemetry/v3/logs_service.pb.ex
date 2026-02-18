defmodule Envoy.Extensions.AccessLoggers.OpenTelemetry.V3.OpenTelemetryAccessLogConfig do
  @moduledoc """
  Configuration for the built-in ``envoy.access_loggers.open_telemetry``
  :ref:`AccessLog <envoy_v3_api_msg_config.accesslog.v3.AccessLog>`. This configuration will
  populate `opentelemetry.proto.collector.v1.logs.ExportLogsServiceRequest.resource_logs <https://github.com/open-telemetry/opentelemetry-proto/blob/main/opentelemetry/proto/collector/logs/v1/logs_service.proto>`_.
  In addition, the request start time is set in the dedicated field.
  [#extension: envoy.access_loggers.open_telemetry]
  [#next-free-field: 15]
  [#protodoc-title: OpenTelemetry Access Log]
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.open_telemetry.v3.OpenTelemetryAccessLogConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :common_config, 1,
    type: Envoy.Extensions.AccessLoggers.Grpc.V3.CommonGrpcAccessLogConfig,
    json_name: "commonConfig",
    deprecated: true

  field :http_service, 8, type: Envoy.Config.Core.V3.HttpService, json_name: "httpService"
  field :grpc_service, 9, type: Envoy.Config.Core.V3.GrpcService, json_name: "grpcService"
  field :disable_builtin_labels, 5, type: :bool, json_name: "disableBuiltinLabels"

  field :resource_attributes, 4,
    type: Opentelemetry.Proto.Common.V1.KeyValueList,
    json_name: "resourceAttributes"

  field :body, 2, type: Opentelemetry.Proto.Common.V1.AnyValue
  field :attributes, 3, type: Opentelemetry.Proto.Common.V1.KeyValueList
  field :stat_prefix, 6, type: :string, json_name: "statPrefix"
  field :formatters, 7, repeated: true, type: Envoy.Config.Core.V3.TypedExtensionConfig
  field :log_name, 10, type: :string, json_name: "logName"

  field :buffer_flush_interval, 11,
    type: Google.Protobuf.Duration,
    json_name: "bufferFlushInterval"

  field :buffer_size_bytes, 12, type: Google.Protobuf.UInt32Value, json_name: "bufferSizeBytes"

  field :filter_state_objects_to_log, 13,
    repeated: true,
    type: :string,
    json_name: "filterStateObjectsToLog"

  field :custom_tags, 14,
    repeated: true,
    type: Envoy.Type.Tracing.V3.CustomTag,
    json_name: "customTags"
end

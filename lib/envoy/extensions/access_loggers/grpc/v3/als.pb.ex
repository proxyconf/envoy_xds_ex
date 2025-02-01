defmodule Envoy.Extensions.AccessLoggers.Grpc.V3.HttpGrpcAccessLogConfig do
  @moduledoc """
  Configuration for the built-in ``envoy.access_loggers.http_grpc``
  :ref:`AccessLog <envoy_v3_api_msg_config.accesslog.v3.AccessLog>`. This configuration will
  populate :ref:`StreamAccessLogsMessage.http_logs
  <envoy_v3_api_field_service.accesslog.v3.StreamAccessLogsMessage.http_logs>`.
  [#extension: envoy.access_loggers.http_grpc]
  [#protodoc-title: gRPC Access Log Service (ALS)]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :common_config, 1,
    type: Envoy.Extensions.AccessLoggers.Grpc.V3.CommonGrpcAccessLogConfig,
    json_name: "commonConfig",
    deprecated: false

  field :additional_request_headers_to_log, 2,
    repeated: true,
    type: :string,
    json_name: "additionalRequestHeadersToLog"

  field :additional_response_headers_to_log, 3,
    repeated: true,
    type: :string,
    json_name: "additionalResponseHeadersToLog"

  field :additional_response_trailers_to_log, 4,
    repeated: true,
    type: :string,
    json_name: "additionalResponseTrailersToLog"
end

defmodule Envoy.Extensions.AccessLoggers.Grpc.V3.TcpGrpcAccessLogConfig do
  @moduledoc """
  Configuration for the built-in ``envoy.access_loggers.tcp_grpc`` type. This configuration will
  populate ``StreamAccessLogsMessage.tcp_logs``.
  [#extension: envoy.access_loggers.tcp_grpc]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :common_config, 1,
    type: Envoy.Extensions.AccessLoggers.Grpc.V3.CommonGrpcAccessLogConfig,
    json_name: "commonConfig",
    deprecated: false
end

defmodule Envoy.Extensions.AccessLoggers.Grpc.V3.CommonGrpcAccessLogConfig do
  @moduledoc """
  Common configuration for gRPC access logs.
  [#next-free-field: 9]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :log_name, 1, type: :string, json_name: "logName", deprecated: false

  field :grpc_service, 2,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    deprecated: false

  field :transport_api_version, 6,
    type: Envoy.Config.Core.V3.ApiVersion,
    json_name: "transportApiVersion",
    enum: true,
    deprecated: false

  field :buffer_flush_interval, 3,
    type: Google.Protobuf.Duration,
    json_name: "bufferFlushInterval",
    deprecated: false

  field :buffer_size_bytes, 4, type: Google.Protobuf.UInt32Value, json_name: "bufferSizeBytes"

  field :filter_state_objects_to_log, 5,
    repeated: true,
    type: :string,
    json_name: "filterStateObjectsToLog"

  field :grpc_stream_retry_policy, 7,
    type: Envoy.Config.Core.V3.RetryPolicy,
    json_name: "grpcStreamRetryPolicy"

  field :custom_tags, 8,
    repeated: true,
    type: Envoy.Type.Tracing.V3.CustomTag,
    json_name: "customTags"
end

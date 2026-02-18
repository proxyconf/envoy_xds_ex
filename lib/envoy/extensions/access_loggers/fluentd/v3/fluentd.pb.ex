defmodule Envoy.Extensions.AccessLoggers.Fluentd.V3.FluentdAccessLogConfig.RetryOptions do
  use Protobuf,
    full_name: "envoy.extensions.access_loggers.fluentd.v3.FluentdAccessLogConfig.RetryOptions",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :max_connect_attempts, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConnectAttempts"

  field :backoff_options, 2,
    type: Envoy.Config.Core.V3.BackoffStrategy,
    json_name: "backoffOptions"
end

defmodule Envoy.Extensions.AccessLoggers.Fluentd.V3.FluentdAccessLogConfig do
  @moduledoc """
  Configuration for the *envoy.access_loggers.fluentd* :ref:`AccessLog <envoy_v3_api_msg_config.accesslog.v3.AccessLog>`.
  This access log extension will send the emitted access logs over a TCP connection to an upstream that is accepting
  the Fluentd Forward Protocol as described in: `Fluentd Forward Protocol Specification
  <https://github.com/fluent/fluentd/wiki/Forward-Protocol-Specification-v1>`_.
  [#extension: envoy.access_loggers.fluentd]
  [#next-free-field: 9]
  [#protodoc-title: Fluentd access log]
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.fluentd.v3.FluentdAccessLogConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :cluster, 1, type: :string, deprecated: false
  field :tag, 2, type: :string, deprecated: false
  field :stat_prefix, 3, type: :string, json_name: "statPrefix", deprecated: false

  field :buffer_flush_interval, 4,
    type: Google.Protobuf.Duration,
    json_name: "bufferFlushInterval",
    deprecated: false

  field :buffer_size_bytes, 5, type: Google.Protobuf.UInt32Value, json_name: "bufferSizeBytes"
  field :record, 6, type: Google.Protobuf.Struct, deprecated: false

  field :retry_options, 7,
    type: Envoy.Extensions.AccessLoggers.Fluentd.V3.FluentdAccessLogConfig.RetryOptions,
    json_name: "retryOptions"

  field :formatters, 8, repeated: true, type: Envoy.Config.Core.V3.TypedExtensionConfig
end

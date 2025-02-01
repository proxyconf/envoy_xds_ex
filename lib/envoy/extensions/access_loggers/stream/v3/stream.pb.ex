defmodule Envoy.Extensions.AccessLoggers.Stream.V3.StdoutAccessLog do
  @moduledoc """
  Custom configuration for an :ref:`AccessLog <envoy_v3_api_msg_config.accesslog.v3.AccessLog>`
  that writes log entries directly to the operating system's standard output.
  [#extension: envoy.access_loggers.stdout]
  [#protodoc-title: Standard Streams Access loggers]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :access_log_format, 0

  field :log_format, 1,
    type: Envoy.Config.Core.V3.SubstitutionFormatString,
    json_name: "logFormat",
    oneof: 0,
    deprecated: false
end

defmodule Envoy.Extensions.AccessLoggers.Stream.V3.StderrAccessLog do
  @moduledoc """
  Custom configuration for an :ref:`AccessLog <envoy_v3_api_msg_config.accesslog.v3.AccessLog>`
  that writes log entries directly to the operating system's standard error.
  [#extension: envoy.access_loggers.stderr]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :access_log_format, 0

  field :log_format, 1,
    type: Envoy.Config.Core.V3.SubstitutionFormatString,
    json_name: "logFormat",
    oneof: 0,
    deprecated: false
end

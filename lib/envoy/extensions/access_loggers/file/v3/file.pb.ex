defmodule Envoy.Extensions.AccessLoggers.File.V3.FileAccessLog do
  @moduledoc """
  Custom configuration for an :ref:`AccessLog <envoy_v3_api_msg_config.accesslog.v3.AccessLog>`
  that writes log entries directly to a file. Configures the built-in ``envoy.access_loggers.file``
  AccessLog.
  [#next-free-field: 6]
  [#protodoc-title: File access log]
  [#extension: envoy.access_loggers.file]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :access_log_format, 0

  field :path, 1, type: :string, deprecated: false
  field :format, 2, type: :string, oneof: 0, deprecated: true

  field :json_format, 3,
    type: Google.Protobuf.Struct,
    json_name: "jsonFormat",
    oneof: 0,
    deprecated: true

  field :typed_json_format, 4,
    type: Google.Protobuf.Struct,
    json_name: "typedJsonFormat",
    oneof: 0,
    deprecated: true

  field :log_format, 5,
    type: Envoy.Config.Core.V3.SubstitutionFormatString,
    json_name: "logFormat",
    oneof: 0,
    deprecated: false
end

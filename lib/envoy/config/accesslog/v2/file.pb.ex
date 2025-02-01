defmodule Envoy.Config.Accesslog.V2.FileAccessLog do
  @moduledoc """
  Custom configuration for an :ref:`AccessLog <envoy_api_msg_config.filter.accesslog.v2.AccessLog>`
  that writes log entries directly to a file. Configures the built-in *envoy.access_loggers.file*
  AccessLog.
  [#protodoc-title: File access log]
  [#extension: envoy.access_loggers.file]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :access_log_format, 0

  field :path, 1, type: :string, deprecated: false
  field :format, 2, type: :string, oneof: 0
  field :json_format, 3, type: Google.Protobuf.Struct, json_name: "jsonFormat", oneof: 0

  field :typed_json_format, 4,
    type: Google.Protobuf.Struct,
    json_name: "typedJsonFormat",
    oneof: 0
end

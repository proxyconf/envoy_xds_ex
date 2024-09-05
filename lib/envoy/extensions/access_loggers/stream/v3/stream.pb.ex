defmodule Envoy.Extensions.AccessLoggers.Stream.V3.StdoutAccessLog do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :access_log_format, 0

  field :log_format, 1,
    type: Envoy.Config.Core.V3.SubstitutionFormatString,
    json_name: "logFormat",
    oneof: 0,
    deprecated: false
end

defmodule Envoy.Extensions.AccessLoggers.Stream.V3.StderrAccessLog do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :access_log_format, 0

  field :log_format, 1,
    type: Envoy.Config.Core.V3.SubstitutionFormatString,
    json_name: "logFormat",
    oneof: 0,
    deprecated: false
end
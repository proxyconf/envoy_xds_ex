defmodule Envoy.Service.Accesslog.V3.StreamAccessLogsResponse do
  @moduledoc """
  Empty response for the StreamAccessLogs API. Will never be sent. See below.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.Identifier do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node, 1, type: Envoy.Config.Core.V3.Node, deprecated: false
  field :log_name, 2, type: :string, json_name: "logName", deprecated: false
end

defmodule Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.HTTPAccessLogEntries do
  @moduledoc """
  Wrapper for batches of HTTP access log entries.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :log_entry, 1,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.HTTPAccessLogEntry,
    json_name: "logEntry",
    deprecated: false
end

defmodule Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.TCPAccessLogEntries do
  @moduledoc """
  Wrapper for batches of TCP access log entries.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :log_entry, 1,
    repeated: true,
    type: Envoy.Data.Accesslog.V3.TCPAccessLogEntry,
    json_name: "logEntry",
    deprecated: false
end

defmodule Envoy.Service.Accesslog.V3.StreamAccessLogsMessage do
  @moduledoc """
  Stream message for the StreamAccessLogs API. Envoy will open a stream to the server and stream
  access logs without ever expecting a response.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :log_entries, 0

  field :identifier, 1, type: Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.Identifier

  field :http_logs, 2,
    type: Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.HTTPAccessLogEntries,
    json_name: "httpLogs",
    oneof: 0

  field :tcp_logs, 3,
    type: Envoy.Service.Accesslog.V3.StreamAccessLogsMessage.TCPAccessLogEntries,
    json_name: "tcpLogs",
    oneof: 0
end

defmodule Envoy.Service.Accesslog.V3.AccessLogService.Service do
  @moduledoc """
  Service for streaming access logs from Envoy to an access log server.
  [#protodoc-title: gRPC access log service (ALS)]
  """

  use GRPC.Service,
    name: "envoy.service.accesslog.v3.AccessLogService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamAccessLogs,
      stream(Envoy.Service.Accesslog.V3.StreamAccessLogsMessage),
      Envoy.Service.Accesslog.V3.StreamAccessLogsResponse
end

defmodule Envoy.Service.Accesslog.V3.AccessLogService.Stub do
  use GRPC.Stub, service: Envoy.Service.Accesslog.V3.AccessLogService.Service
end

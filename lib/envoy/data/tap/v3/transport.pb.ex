defmodule Envoy.Data.Tap.V3.SocketEvent.Read do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :data, 1, type: Envoy.Data.Tap.V3.Body
end

defmodule Envoy.Data.Tap.V3.SocketEvent.Write do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :data, 1, type: Envoy.Data.Tap.V3.Body
  field :end_stream, 2, type: :bool, json_name: "endStream"
end

defmodule Envoy.Data.Tap.V3.SocketEvent.Closed do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Envoy.Data.Tap.V3.SocketEvent do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :event_selector, 0

  field :timestamp, 1, type: Google.Protobuf.Timestamp
  field :read, 2, type: Envoy.Data.Tap.V3.SocketEvent.Read, oneof: 0
  field :write, 3, type: Envoy.Data.Tap.V3.SocketEvent.Write, oneof: 0
  field :closed, 4, type: Envoy.Data.Tap.V3.SocketEvent.Closed, oneof: 0
end

defmodule Envoy.Data.Tap.V3.SocketBufferedTrace do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :trace_id, 1, type: :uint64, json_name: "traceId"
  field :connection, 2, type: Envoy.Data.Tap.V3.Connection
  field :events, 3, repeated: true, type: Envoy.Data.Tap.V3.SocketEvent
  field :read_truncated, 4, type: :bool, json_name: "readTruncated"
  field :write_truncated, 5, type: :bool, json_name: "writeTruncated"
end

defmodule Envoy.Data.Tap.V3.SocketStreamedTraceSegment do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :message_piece, 0

  field :trace_id, 1, type: :uint64, json_name: "traceId"
  field :connection, 2, type: Envoy.Data.Tap.V3.Connection, oneof: 0
  field :event, 3, type: Envoy.Data.Tap.V3.SocketEvent, oneof: 0
end
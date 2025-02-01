defmodule Envoy.Data.Tap.V3.SocketEvent.Read do
  @moduledoc """
  Data read by Envoy from the transport socket.
  TODO(htuch): Half-close for reads.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :data, 1, type: Envoy.Data.Tap.V3.Body
end

defmodule Envoy.Data.Tap.V3.SocketEvent.Write do
  @moduledoc """
  Data written by Envoy to the transport socket.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :data, 1, type: Envoy.Data.Tap.V3.Body
  field :end_stream, 2, type: :bool, json_name: "endStream"
end

defmodule Envoy.Data.Tap.V3.SocketEvent.Closed do
  @moduledoc """
  The connection was closed.
  TODO(mattklein123): Close event type.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Data.Tap.V3.SocketEvent do
  @moduledoc """
  Event in a socket trace.
  [#protodoc-title: Transport tap data]
  Trace format for the tap transport socket extension. This dumps plain text read/write
  sequences on a socket.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :event_selector, 0

  field :timestamp, 1, type: Google.Protobuf.Timestamp
  field :read, 2, type: Envoy.Data.Tap.V3.SocketEvent.Read, oneof: 0
  field :write, 3, type: Envoy.Data.Tap.V3.SocketEvent.Write, oneof: 0
  field :closed, 4, type: Envoy.Data.Tap.V3.SocketEvent.Closed, oneof: 0
end

defmodule Envoy.Data.Tap.V3.SocketBufferedTrace do
  @moduledoc """
  Sequence of read/write events that constitute a buffered trace on a socket.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :trace_id, 1, type: :uint64, json_name: "traceId"
  field :connection, 2, type: Envoy.Data.Tap.V3.Connection
  field :events, 3, repeated: true, type: Envoy.Data.Tap.V3.SocketEvent
  field :read_truncated, 4, type: :bool, json_name: "readTruncated"
  field :write_truncated, 5, type: :bool, json_name: "writeTruncated"
end

defmodule Envoy.Data.Tap.V3.SocketStreamedTraceSegment do
  @moduledoc """
  A streamed socket trace segment. Multiple segments make up a full trace.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :message_piece, 0

  field :trace_id, 1, type: :uint64, json_name: "traceId"
  field :connection, 2, type: Envoy.Data.Tap.V3.Connection, oneof: 0
  field :event, 3, type: Envoy.Data.Tap.V3.SocketEvent, oneof: 0
end

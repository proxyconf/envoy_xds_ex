defmodule Envoy.Data.Tap.V2alpha.TraceWrapper do
  @moduledoc """
  Wrapper for all fully buffered and streamed tap traces that Envoy emits. This is required for
  sending traces over gRPC APIs or more easily persisting binary messages to files.
  [#protodoc-title: Tap data wrappers]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :trace, 0

  field :http_buffered_trace, 1,
    type: Envoy.Data.Tap.V2alpha.HttpBufferedTrace,
    json_name: "httpBufferedTrace",
    oneof: 0

  field :http_streamed_trace_segment, 2,
    type: Envoy.Data.Tap.V2alpha.HttpStreamedTraceSegment,
    json_name: "httpStreamedTraceSegment",
    oneof: 0

  field :socket_buffered_trace, 3,
    type: Envoy.Data.Tap.V2alpha.SocketBufferedTrace,
    json_name: "socketBufferedTrace",
    oneof: 0

  field :socket_streamed_trace_segment, 4,
    type: Envoy.Data.Tap.V2alpha.SocketStreamedTraceSegment,
    json_name: "socketStreamedTraceSegment",
    oneof: 0
end

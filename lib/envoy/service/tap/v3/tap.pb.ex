defmodule Envoy.Service.Tap.V3.StreamTapsRequest.Identifier do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node, 1, type: Envoy.Config.Core.V3.Node, deprecated: false
  field :tap_id, 2, type: :string, json_name: "tapId"
end

defmodule Envoy.Service.Tap.V3.StreamTapsRequest do
  @moduledoc """
  [#not-implemented-hide:] Stream message for the Tap API. Envoy will open a stream to the server
  and stream taps without ever expecting a response.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :identifier, 1, type: Envoy.Service.Tap.V3.StreamTapsRequest.Identifier
  field :trace_id, 2, type: :uint64, json_name: "traceId"
  field :trace, 3, type: Envoy.Data.Tap.V3.TraceWrapper
end

defmodule Envoy.Service.Tap.V3.StreamTapsResponse do
  @moduledoc """
  [#not-implemented-hide:]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.Tap.V3.TapSinkService.Service do
  @moduledoc """
  [#not-implemented-hide:] A tap service to receive incoming taps. Envoy will call
  StreamTaps to deliver captured taps to the server
  [#protodoc-title: Tap sink service]
  """

  use GRPC.Service,
    name: "envoy.service.tap.v3.TapSinkService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamTaps,
      stream(Envoy.Service.Tap.V3.StreamTapsRequest),
      Envoy.Service.Tap.V3.StreamTapsResponse
end

defmodule Envoy.Service.Tap.V3.TapSinkService.Stub do
  use GRPC.Stub, service: Envoy.Service.Tap.V3.TapSinkService.Service
end

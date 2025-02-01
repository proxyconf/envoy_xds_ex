defmodule Envoy.Service.Tap.V2alpha.StreamTapsRequest.Identifier do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node, 1, type: Envoy.Api.V2.Core.Node, deprecated: false
  field :tap_id, 2, type: :string, json_name: "tapId"
end

defmodule Envoy.Service.Tap.V2alpha.StreamTapsRequest do
  @moduledoc """
  [#not-implemented-hide:] Stream message for the Tap API. Envoy will open a stream to the server
  and stream taps without ever expecting a response.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :identifier, 1, type: Envoy.Service.Tap.V2alpha.StreamTapsRequest.Identifier
  field :trace_id, 2, type: :uint64, json_name: "traceId"
  field :trace, 3, type: Envoy.Data.Tap.V2alpha.TraceWrapper
end

defmodule Envoy.Service.Tap.V2alpha.StreamTapsResponse do
  @moduledoc """
  [#not-implemented-hide:]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.Tap.V2alpha.TapSinkService.Service do
  @moduledoc """
  [#not-implemented-hide:] A tap service to receive incoming taps. Envoy will call
  StreamTaps to deliver captured taps to the server
  [#protodoc-title: Tap Sink Service]
  """

  use GRPC.Service,
    name: "envoy.service.tap.v2alpha.TapSinkService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamTaps,
      stream(Envoy.Service.Tap.V2alpha.StreamTapsRequest),
      Envoy.Service.Tap.V2alpha.StreamTapsResponse
end

defmodule Envoy.Service.Tap.V2alpha.TapSinkService.Stub do
  use GRPC.Stub, service: Envoy.Service.Tap.V2alpha.TapSinkService.Service
end

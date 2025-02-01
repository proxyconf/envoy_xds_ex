defmodule Envoy.Extensions.Filters.Http.GrpcJsonReverseTranscoder.V3.GrpcJsonReverseTranscoder do
  @moduledoc """
  [#next-free-field: 6]
  ``GrpcJsonReverseTranscoder`` is the filter configuration for the gRPC JSON
  reverse transcoder. The reverse transcoder acts as a bridge between a gRPC
  client and an HTTP/JSON server, converting the gRPC request into HTTP/JSON
  for the HTTP backend and the HTTP/JSON response back to gRPC for the gRPC
  client. This effectively reverses the behavior of the
  :ref:`grpc_json_transcoder filter <config_http_filters_grpc_json_transcoder>`,
  allowing a gRPC client to communicate with an HTTP/JSON server.
  [#protodoc-title: gRPC-JSON reverse transcoder]
  gRPC-JSON reverse transcoder :ref:`configuration overview <config_http_filters_grpc_json_reverse_transcoder>`.
  [#extension: envoy.filters.http.grpc_json_reverse_transcoder]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :descriptor_path, 1, type: :string, json_name: "descriptorPath"
  field :descriptor_binary, 2, type: :bytes, json_name: "descriptorBinary"

  field :max_request_body_size, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxRequestBodySize",
    deprecated: false

  field :max_response_body_size, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxResponseBodySize",
    deprecated: false

  field :api_version_header, 5, type: :string, json_name: "apiVersionHeader"
end

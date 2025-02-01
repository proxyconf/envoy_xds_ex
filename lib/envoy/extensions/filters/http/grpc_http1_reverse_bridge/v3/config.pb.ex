defmodule Envoy.Extensions.Filters.Http.GrpcHttp1ReverseBridge.V3.FilterConfig do
  @moduledoc """
  gRPC reverse bridge filter configuration
  [#protodoc-title: gRPC HTTP/1.1 Reverse Bridge]
  gRPC HTTP/1.1 Reverse Bridge :ref:`configuration overview
  <config_http_filters_grpc_http1_reverse_bridge>`.
  [#extension: envoy.filters.http.grpc_http1_reverse_bridge]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :content_type, 1, type: :string, json_name: "contentType", deprecated: false
  field :withhold_grpc_frames, 2, type: :bool, json_name: "withholdGrpcFrames"

  field :response_size_header, 3,
    type: :string,
    json_name: "responseSizeHeader",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.GrpcHttp1ReverseBridge.V3.FilterConfigPerRoute do
  @moduledoc """
  gRPC reverse bridge filter configuration per virtualhost/route/weighted-cluster level.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :disabled, 1, type: :bool
end

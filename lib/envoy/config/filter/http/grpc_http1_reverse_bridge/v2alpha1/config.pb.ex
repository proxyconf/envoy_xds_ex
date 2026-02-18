defmodule Envoy.Config.Filter.Http.GrpcHttp1ReverseBridge.V2alpha1.FilterConfig do
  @moduledoc """
  gRPC reverse bridge filter configuration
  [#protodoc-title: gRPC HTTP/1.1 Reverse Bridge]
  gRPC HTTP/1.1 Reverse Bridge :ref:`configuration overview
  <config_http_filters_grpc_http1_reverse_bridge>`.
  [#extension: envoy.filters.http.grpc_http1_reverse_bridge]
  """

  use Protobuf,
    full_name: "envoy.config.filter.http.grpc_http1_reverse_bridge.v2alpha1.FilterConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :content_type, 1, type: :string, json_name: "contentType", deprecated: false
  field :withhold_grpc_frames, 2, type: :bool, json_name: "withholdGrpcFrames"
end

defmodule Envoy.Config.Filter.Http.GrpcHttp1ReverseBridge.V2alpha1.FilterConfigPerRoute do
  @moduledoc """
  gRPC reverse bridge filter configuration per virtualhost/route/weighted-cluster level.
  """

  use Protobuf,
    full_name: "envoy.config.filter.http.grpc_http1_reverse_bridge.v2alpha1.FilterConfigPerRoute",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :disabled, 1, type: :bool
end

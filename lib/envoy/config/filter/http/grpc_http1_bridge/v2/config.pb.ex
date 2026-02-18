defmodule Envoy.Config.Filter.Http.GrpcHttp1Bridge.V2.Config do
  @moduledoc """
  gRPC HTTP/1.1 Bridge filter config.
  [#protodoc-title: gRPC HTTP/1.1 Bridge]
  gRPC HTTP/1.1 Bridge Filter :ref:`configuration overview <config_http_filters_grpc_bridge>`.
  [#extension: envoy.filters.http.grpc_http1_bridge]
  """

  use Protobuf,
    full_name: "envoy.config.filter.http.grpc_http1_bridge.v2.Config",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

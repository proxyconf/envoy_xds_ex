defmodule Envoy.Extensions.Filters.Http.ConnectGrpcBridge.V3.FilterConfig do
  @moduledoc """
  Connect RPC to gRPC bridge filter configuration
  [#protodoc-title: Connect RPC to gRPC] Connect RPC to gRPC bridge
  :ref:`configuration overview <config_http_filters_connect_grpc_bridge>`.
  [#extension: envoy.filters.http.connect_grpc_bridge]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.connect_grpc_bridge.v3.FilterConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

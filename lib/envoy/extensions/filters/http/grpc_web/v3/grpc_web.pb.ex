defmodule Envoy.Extensions.Filters.Http.GrpcWeb.V3.GrpcWeb do
  @moduledoc """
  gRPC Web filter config.
  [#protodoc-title: gRPC Web]
  gRPC Web :ref:`configuration overview <config_http_filters_grpc_web>`.
  [#extension: envoy.filters.http.grpc_web]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.grpc_web.v3.GrpcWeb",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

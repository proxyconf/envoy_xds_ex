defmodule Envoy.Config.Filter.Http.GrpcWeb.V2.GrpcWeb do
  @moduledoc """
  gRPC Web filter config.
  [#protodoc-title: gRPC Web]
  gRPC Web :ref:`configuration overview <config_http_filters_grpc_web>`.
  [#extension: envoy.filters.http.grpc_web]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

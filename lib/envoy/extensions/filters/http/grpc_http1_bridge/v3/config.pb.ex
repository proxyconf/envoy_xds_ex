defmodule Envoy.Extensions.Filters.Http.GrpcHttp1Bridge.V3.Config do
  @moduledoc """
  gRPC HTTP/1.1 Bridge filter config.
  [#protodoc-title: gRPC HTTP/1.1 Bridge]
  gRPC HTTP/1.1 Bridge Filter :ref:`configuration overview <config_http_filters_grpc_bridge>`.
  [#extension: envoy.filters.http.grpc_http1_bridge]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :upgrade_protobuf_to_grpc, 1, type: :bool, json_name: "upgradeProtobufToGrpc"
  field :ignore_query_parameters, 2, type: :bool, json_name: "ignoreQueryParameters"
end

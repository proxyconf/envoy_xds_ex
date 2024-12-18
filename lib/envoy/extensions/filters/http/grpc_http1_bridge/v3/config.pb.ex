defmodule Envoy.Extensions.Filters.Http.GrpcHttp1Bridge.V3.Config do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :upgrade_protobuf_to_grpc, 1, type: :bool, json_name: "upgradeProtobufToGrpc"
  field :ignore_query_parameters, 2, type: :bool, json_name: "ignoreQueryParameters"
end
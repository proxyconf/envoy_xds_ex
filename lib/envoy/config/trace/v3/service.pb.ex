defmodule Envoy.Config.Trace.V3.TraceServiceConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :grpc_service, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    deprecated: false
end
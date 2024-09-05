defmodule Envoy.Config.Trace.V2.TraceServiceConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :grpc_service, 1,
    type: Envoy.Api.V2.Core.GrpcService,
    json_name: "grpcService",
    deprecated: false
end
defmodule Envoy.Config.Core.V3.EventServiceConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :config_source_specifier, 0

  field :grpc_service, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    oneof: 0
end
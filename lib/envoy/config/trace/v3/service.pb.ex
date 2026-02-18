defmodule Envoy.Config.Trace.V3.TraceServiceConfig do
  @moduledoc """
  Configuration structure.
  [#protodoc-title: Trace Service]
  """

  use Protobuf,
    full_name: "envoy.config.trace.v3.TraceServiceConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :grpc_service, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    deprecated: false
end

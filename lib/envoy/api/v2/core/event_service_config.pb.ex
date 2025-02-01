defmodule Envoy.Api.V2.Core.EventServiceConfig do
  @moduledoc """
  [#not-implemented-hide:]
  Configuration of the event reporting service endpoint.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_source_specifier, 0

  field :grpc_service, 1, type: Envoy.Api.V2.Core.GrpcService, json_name: "grpcService", oneof: 0
end

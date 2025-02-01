defmodule Envoy.Config.Ratelimit.V3.RateLimitServiceConfig do
  @moduledoc """
  Rate limit :ref:`configuration overview <config_rate_limit_service>`.
  [#protodoc-title: Rate limit service]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :grpc_service, 2,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    deprecated: false

  field :transport_api_version, 4,
    type: Envoy.Config.Core.V3.ApiVersion,
    json_name: "transportApiVersion",
    enum: true,
    deprecated: false
end

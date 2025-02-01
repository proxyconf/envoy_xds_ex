defmodule Envoy.Config.Ratelimit.V2.RateLimitServiceConfig do
  @moduledoc """
  Rate limit :ref:`configuration overview <config_rate_limit_service>`.
  [#protodoc-title: Rate limit service]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :grpc_service, 2,
    type: Envoy.Api.V2.Core.GrpcService,
    json_name: "grpcService",
    deprecated: false
end

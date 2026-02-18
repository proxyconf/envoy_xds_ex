defmodule Envoy.Extensions.HealthCheckers.Redis.V3.Redis do
  @moduledoc """
  [#protodoc-title: Redis]
  Redis health checker :ref:`configuration overview <config_health_checkers_redis>`.
  [#extension: envoy.health_checkers.redis]
  """

  use Protobuf,
    full_name: "envoy.extensions.health_checkers.redis.v3.Redis",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string

  field :aws_iam, 2,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.AwsIam,
    json_name: "awsIam"
end

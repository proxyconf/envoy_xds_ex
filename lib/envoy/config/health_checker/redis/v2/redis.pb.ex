defmodule Envoy.Config.HealthChecker.Redis.V2.Redis do
  @moduledoc """
  [#protodoc-title: Redis]
  Redis health checker :ref:`configuration overview <config_health_checkers_redis>`.
  [#extension: envoy.health_checkers.redis]
  """

  use Protobuf,
    full_name: "envoy.config.health_checker.redis.v2.Redis",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
end

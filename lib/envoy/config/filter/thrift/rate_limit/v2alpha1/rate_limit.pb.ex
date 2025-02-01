defmodule Envoy.Config.Filter.Thrift.RateLimit.V2alpha1.RateLimit do
  @moduledoc """
  [#next-free-field: 6]
  [#protodoc-title: Rate limit]
  Rate limit :ref:`configuration overview <config_thrift_filters_rate_limit>`.
  [#extension: envoy.filters.thrift.rate_limit]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :domain, 1, type: :string, deprecated: false
  field :stage, 2, type: :uint32, deprecated: false
  field :timeout, 3, type: Google.Protobuf.Duration
  field :failure_mode_deny, 4, type: :bool, json_name: "failureModeDeny"

  field :rate_limit_service, 5,
    type: Envoy.Config.Ratelimit.V2.RateLimitServiceConfig,
    json_name: "rateLimitService",
    deprecated: false
end

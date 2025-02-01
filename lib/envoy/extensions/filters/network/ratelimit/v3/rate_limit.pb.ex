defmodule Envoy.Extensions.Filters.Network.Ratelimit.V3.RateLimit do
  @moduledoc """
  [#next-free-field: 7]
  [#protodoc-title: Rate limit]
  Rate limit :ref:`configuration overview <config_network_filters_rate_limit>`.
  [#extension: envoy.filters.network.ratelimit]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :domain, 2, type: :string, deprecated: false

  field :descriptors, 3,
    repeated: true,
    type: Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor,
    deprecated: false

  field :timeout, 4, type: Google.Protobuf.Duration
  field :failure_mode_deny, 5, type: :bool, json_name: "failureModeDeny"

  field :rate_limit_service, 6,
    type: Envoy.Config.Ratelimit.V3.RateLimitServiceConfig,
    json_name: "rateLimitService",
    deprecated: false
end

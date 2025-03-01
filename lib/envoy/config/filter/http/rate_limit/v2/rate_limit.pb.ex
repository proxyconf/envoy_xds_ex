defmodule Envoy.Config.Filter.Http.RateLimit.V2.RateLimit do
  @moduledoc """
  [#next-free-field: 8]
  [#protodoc-title: Rate limit]
  Rate limit :ref:`configuration overview <config_http_filters_rate_limit>`.
  [#extension: envoy.filters.http.ratelimit]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :domain, 1, type: :string, deprecated: false
  field :stage, 2, type: :uint32, deprecated: false
  field :request_type, 3, type: :string, json_name: "requestType", deprecated: false
  field :timeout, 4, type: Google.Protobuf.Duration
  field :failure_mode_deny, 5, type: :bool, json_name: "failureModeDeny"

  field :rate_limited_as_resource_exhausted, 6,
    type: :bool,
    json_name: "rateLimitedAsResourceExhausted"

  field :rate_limit_service, 7,
    type: Envoy.Config.Ratelimit.V2.RateLimitServiceConfig,
    json_name: "rateLimitService",
    deprecated: false
end

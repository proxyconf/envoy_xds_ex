defmodule Envoy.Extensions.Filters.Listener.LocalRatelimit.V3.LocalRateLimit do
  @moduledoc """
  [#protodoc-title: Local Rate Limit Filter]
  Local rate limit :ref:`configuration overview <config_listener_filters_local_rate_limit>`.
  [#extension: envoy.filters.listener.local_ratelimit]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :token_bucket, 2,
    type: Envoy.Type.V3.TokenBucket,
    json_name: "tokenBucket",
    deprecated: false

  field :runtime_enabled, 3,
    type: Envoy.Config.Core.V3.RuntimeFeatureFlag,
    json_name: "runtimeEnabled"
end

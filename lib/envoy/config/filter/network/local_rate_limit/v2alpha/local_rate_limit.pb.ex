defmodule Envoy.Config.Filter.Network.LocalRateLimit.V2alpha.LocalRateLimit do
  @moduledoc """
  [#protodoc-title: Local rate limit]
  Local rate limit :ref:`configuration overview <config_network_filters_local_rate_limit>`.
  [#extension: envoy.filters.network.local_ratelimit]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :token_bucket, 2,
    type: Envoy.Type.TokenBucket,
    json_name: "tokenBucket",
    deprecated: false

  field :runtime_enabled, 3,
    type: Envoy.Api.V2.Core.RuntimeFeatureFlag,
    json_name: "runtimeEnabled"
end

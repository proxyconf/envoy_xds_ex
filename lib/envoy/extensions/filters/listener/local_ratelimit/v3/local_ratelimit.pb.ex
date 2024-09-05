defmodule Envoy.Extensions.Filters.Listener.LocalRatelimit.V3.LocalRateLimit do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :token_bucket, 2,
    type: Envoy.Type.V3.TokenBucket,
    json_name: "tokenBucket",
    deprecated: false

  field :runtime_enabled, 3,
    type: Envoy.Config.Core.V3.RuntimeFeatureFlag,
    json_name: "runtimeEnabled"
end
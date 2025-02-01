defmodule Envoy.Type.V3.TokenBucket do
  @moduledoc """
  Configures a token bucket, typically used for rate limiting.
  [#protodoc-title: Token bucket]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :max_tokens, 1, type: :uint32, json_name: "maxTokens", deprecated: false

  field :tokens_per_fill, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "tokensPerFill",
    deprecated: false

  field :fill_interval, 3,
    type: Google.Protobuf.Duration,
    json_name: "fillInterval",
    deprecated: false
end

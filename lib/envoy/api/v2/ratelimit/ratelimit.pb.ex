defmodule Envoy.Api.V2.Ratelimit.RateLimitDescriptor.Entry do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string, deprecated: false
  field :value, 2, type: :string, deprecated: false
end

defmodule Envoy.Api.V2.Ratelimit.RateLimitDescriptor do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :entries, 1,
    repeated: true,
    type: Envoy.Api.V2.Ratelimit.RateLimitDescriptor.Entry,
    deprecated: false
end
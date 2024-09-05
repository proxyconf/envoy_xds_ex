defmodule Envoy.Extensions.Matching.InputMatchers.Metadata.V3.Metadata do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :value, 1, type: Envoy.Type.Matcher.V3.ValueMatcher, deprecated: false
  field :invert, 4, type: :bool
end
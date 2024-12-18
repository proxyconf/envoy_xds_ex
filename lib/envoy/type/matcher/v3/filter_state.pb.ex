defmodule Envoy.Type.Matcher.V3.FilterStateMatcher do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :matcher, 0

  field :key, 1, type: :string, deprecated: false

  field :string_match, 2,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "stringMatch",
    oneof: 0
end
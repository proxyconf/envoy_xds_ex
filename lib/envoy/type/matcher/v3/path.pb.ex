defmodule Envoy.Type.Matcher.V3.PathMatcher do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :rule, 0

  field :path, 1, type: Envoy.Type.Matcher.V3.StringMatcher, oneof: 0, deprecated: false
end
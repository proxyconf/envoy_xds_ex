defmodule Envoy.Type.Matcher.V3.DoubleMatcher do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :match_pattern, 0

  field :range, 1, type: Envoy.Type.V3.DoubleRange, oneof: 0
  field :exact, 2, type: :double, oneof: 0
end
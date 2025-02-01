defmodule Envoy.Type.Matcher.DoubleMatcher do
  @moduledoc """
  Specifies the way to match a double value.
  [#protodoc-title: Number matcher]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :match_pattern, 0

  field :range, 1, type: Envoy.Type.DoubleRange, oneof: 0
  field :exact, 2, type: :double, oneof: 0
end

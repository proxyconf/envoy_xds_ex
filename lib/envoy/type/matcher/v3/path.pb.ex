defmodule Envoy.Type.Matcher.V3.PathMatcher do
  @moduledoc """
  Specifies the way to match a path on HTTP request.
  [#protodoc-title: Path matcher]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :rule, 0

  field :path, 1, type: Envoy.Type.Matcher.V3.StringMatcher, oneof: 0, deprecated: false
end

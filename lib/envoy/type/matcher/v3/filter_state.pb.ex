defmodule Envoy.Type.Matcher.V3.FilterStateMatcher do
  @moduledoc """
  FilterStateMatcher provides a general interface for matching the filter state objects.
  [#protodoc-title: Filter state matcher]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :matcher, 0

  field :key, 1, type: :string, deprecated: false

  field :string_match, 2,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "stringMatch",
    oneof: 0

  field :address_match, 3,
    type: Envoy.Type.Matcher.V3.AddressMatcher,
    json_name: "addressMatch",
    oneof: 0
end

defmodule Envoy.Type.Matcher.StringMatcher do
  @moduledoc """
  Specifies the way to match a string.
  [#next-free-field: 7]
  [#protodoc-title: String matcher]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :match_pattern, 0

  field :exact, 1, type: :string, oneof: 0
  field :prefix, 2, type: :string, oneof: 0, deprecated: false
  field :suffix, 3, type: :string, oneof: 0, deprecated: false
  field :regex, 4, type: :string, oneof: 0, deprecated: true

  field :safe_regex, 5,
    type: Envoy.Type.Matcher.RegexMatcher,
    json_name: "safeRegex",
    oneof: 0,
    deprecated: false

  field :ignore_case, 6, type: :bool, json_name: "ignoreCase"
end

defmodule Envoy.Type.Matcher.ListStringMatcher do
  @moduledoc """
  Specifies a list of ways to match a string.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :patterns, 1, repeated: true, type: Envoy.Type.Matcher.StringMatcher, deprecated: false
end

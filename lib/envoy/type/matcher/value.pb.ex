defmodule Envoy.Type.Matcher.ValueMatcher.NullMatch do
  @moduledoc """
  NullMatch is an empty message to specify a null value.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Type.Matcher.ValueMatcher do
  @moduledoc """
  Specifies the way to match a ProtobufWkt::Value. Primitive values and ListValue are supported.
  StructValue is not supported and is always not matched.
  [#next-free-field: 7]
  [#protodoc-title: Value matcher]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :match_pattern, 0

  field :null_match, 1,
    type: Envoy.Type.Matcher.ValueMatcher.NullMatch,
    json_name: "nullMatch",
    oneof: 0

  field :double_match, 2,
    type: Envoy.Type.Matcher.DoubleMatcher,
    json_name: "doubleMatch",
    oneof: 0

  field :string_match, 3,
    type: Envoy.Type.Matcher.StringMatcher,
    json_name: "stringMatch",
    oneof: 0

  field :bool_match, 4, type: :bool, json_name: "boolMatch", oneof: 0
  field :present_match, 5, type: :bool, json_name: "presentMatch", oneof: 0
  field :list_match, 6, type: Envoy.Type.Matcher.ListMatcher, json_name: "listMatch", oneof: 0
end

defmodule Envoy.Type.Matcher.ListMatcher do
  @moduledoc """
  Specifies the way to match a list value.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :match_pattern, 0

  field :one_of, 1, type: Envoy.Type.Matcher.ValueMatcher, json_name: "oneOf", oneof: 0
end

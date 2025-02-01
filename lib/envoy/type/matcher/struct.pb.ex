defmodule Envoy.Type.Matcher.StructMatcher.PathSegment do
  @moduledoc """
  Specifies the segment in a path to retrieve value from Struct.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :segment, 0

  field :key, 1, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Type.Matcher.StructMatcher do
  @moduledoc """
  StructMatcher provides a general interface to check if a given value is matched in
  google.protobuf.Struct. It uses `path` to retrieve the value
  from the struct and then check if it's matched to the specified value.

  For example, for the following Struct:

  .. code-block:: yaml

  fields:
  a:
  struct_value:
  fields:
  b:
  struct_value:
  fields:
  c:
  string_value: pro
  t:
  list_value:
  values:
  - string_value: m
  - string_value: n

  The following MetadataMatcher is matched as the path [a, b, c] will retrieve a string value "pro"
  from the Metadata which is matched to the specified prefix match.

  .. code-block:: yaml

  path:
  - key: a
  - key: b
  - key: c
  value:
  string_match:
  prefix: pr

  The following StructMatcher is matched as the code will match one of the string values in the
  list at the path [a, t].

  .. code-block:: yaml

  path:
  - key: a
  - key: t
  value:
  list_match:
  one_of:
  string_match:
  exact: m

  An example use of StructMatcher is to match metadata in envoy.v*.core.Node.
  [#protodoc-title: Struct matcher]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :path, 2,
    repeated: true,
    type: Envoy.Type.Matcher.StructMatcher.PathSegment,
    deprecated: false

  field :value, 3, type: Envoy.Type.Matcher.ValueMatcher, deprecated: false
end

defmodule Envoy.Type.Matcher.V3.MetadataMatcher.PathSegment do
  @moduledoc """
  Specifies the segment in a path to retrieve value from Metadata.
  Note: Currently it's not supported to retrieve a value from a list in Metadata. This means that
  if the segment key refers to a list, it has to be the last segment in a path.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :segment, 0

  field :key, 1, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Type.Matcher.V3.MetadataMatcher do
  @moduledoc """
  [#next-major-version: MetadataMatcher should use StructMatcher]
  [#protodoc-title: Metadata matcher]
  MetadataMatcher provides a general interface to check if a given value is matched in
  :ref:`Metadata <envoy_v3_api_msg_config.core.v3.Metadata>`. It uses `filter` and `path` to retrieve the value
  from the Metadata and then check if it's matched to the specified value.

  For example, for the following Metadata:

  .. code-block:: yaml

  filter_metadata:
  envoy.filters.http.rbac:
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

  filter: envoy.filters.http.rbac
  path:
  - key: a
  - key: b
  - key: c
  value:
  string_match:
  prefix: pr

  The following MetadataMatcher is matched as the code will match one of the string values in the
  list at the path [a, t].

  .. code-block:: yaml

  filter: envoy.filters.http.rbac
  path:
  - key: a
  - key: t
  value:
  list_match:
  one_of:
  string_match:
  exact: m

  An example use of MetadataMatcher is specifying additional metadata in envoy.filters.http.rbac to
  enforce access control based on dynamic metadata in a request. See :ref:`Permission
  <envoy_v3_api_msg_config.rbac.v3.Permission>` and :ref:`Principal
  <envoy_v3_api_msg_config.rbac.v3.Principal>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :filter, 1, type: :string, deprecated: false

  field :path, 2,
    repeated: true,
    type: Envoy.Type.Matcher.V3.MetadataMatcher.PathSegment,
    deprecated: false

  field :value, 3, type: Envoy.Type.Matcher.V3.ValueMatcher, deprecated: false
  field :invert, 4, type: :bool
end

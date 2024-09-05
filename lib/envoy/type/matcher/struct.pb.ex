defmodule Envoy.Type.Matcher.StructMatcher.PathSegment do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :segment, 0

  field :key, 1, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Type.Matcher.StructMatcher do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :path, 2,
    repeated: true,
    type: Envoy.Type.Matcher.StructMatcher.PathSegment,
    deprecated: false

  field :value, 3, type: Envoy.Type.Matcher.ValueMatcher, deprecated: false
end
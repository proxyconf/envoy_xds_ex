defmodule Envoy.Type.Matcher.MetadataMatcher.PathSegment do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :segment, 0

  field :key, 1, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Type.Matcher.MetadataMatcher do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :filter, 1, type: :string, deprecated: false

  field :path, 2,
    repeated: true,
    type: Envoy.Type.Matcher.MetadataMatcher.PathSegment,
    deprecated: false

  field :value, 3, type: Envoy.Type.Matcher.ValueMatcher, deprecated: false
end
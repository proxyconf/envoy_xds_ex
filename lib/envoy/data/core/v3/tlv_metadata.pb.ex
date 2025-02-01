defmodule Envoy.Data.Core.V3.TlvsMetadata.TypedMetadataEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :bytes
end

defmodule Envoy.Data.Core.V3.TlvsMetadata do
  @moduledoc """
  [#protodoc-title: Proxy Protocol Filter Typed Metadata]
  PROXY protocol filter typed metadata.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :typed_metadata, 1,
    repeated: true,
    type: Envoy.Data.Core.V3.TlvsMetadata.TypedMetadataEntry,
    json_name: "typedMetadata",
    map: true
end

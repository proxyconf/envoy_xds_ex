defmodule Envoy.Extensions.Filters.Http.SetMetadata.V3.Metadata do
  @moduledoc """
  [#protodoc-title: Set-Metadata Filter]

  This filters adds or updates dynamic metadata with static data.

  [#extension: envoy.filters.http.set_metadata]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :metadata_namespace, 1, type: :string, json_name: "metadataNamespace", deprecated: false
  field :allow_overwrite, 2, type: :bool, json_name: "allowOverwrite"
  field :value, 3, type: Google.Protobuf.Struct
  field :typed_value, 4, type: Google.Protobuf.Any, json_name: "typedValue"
end

defmodule Envoy.Extensions.Filters.Http.SetMetadata.V3.Config do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :metadata_namespace, 1, type: :string, json_name: "metadataNamespace", deprecated: true
  field :value, 2, type: Google.Protobuf.Struct, deprecated: true
  field :metadata, 3, repeated: true, type: Envoy.Extensions.Filters.Http.SetMetadata.V3.Metadata
end

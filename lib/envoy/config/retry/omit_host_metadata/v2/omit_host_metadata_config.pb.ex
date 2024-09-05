defmodule Envoy.Config.Retry.OmitHostMetadata.V2.OmitHostMetadataConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :metadata_match, 1, type: Envoy.Api.V2.Core.Metadata, json_name: "metadataMatch"
end
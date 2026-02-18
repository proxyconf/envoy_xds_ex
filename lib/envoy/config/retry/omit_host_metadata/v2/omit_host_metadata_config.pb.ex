defmodule Envoy.Config.Retry.OmitHostMetadata.V2.OmitHostMetadataConfig do
  @moduledoc """
  A retry host predicate that can be used to reject a host based on
  predefined metadata match criteria.
  [#extension: envoy.retry_host_predicates.omit_host_metadata]
  [#protodoc-title: Omit host metadata retry predicate]
  """

  use Protobuf,
    full_name: "envoy.config.retry.omit_host_metadata.v2.OmitHostMetadataConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :metadata_match, 1, type: Envoy.Api.V2.Core.Metadata, json_name: "metadataMatch"
end

defmodule Envoy.Extensions.Retry.Host.OmitHostMetadata.V3.OmitHostMetadataConfig do
  @moduledoc """
  A retry host predicate that can be used to reject a host based on
  predefined metadata match criteria.
  [#extension: envoy.retry_host_predicates.omit_host_metadata]
  [#protodoc-title: Omit host metadata retry predicate]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :metadata_match, 1, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataMatch"
end

defmodule Envoy.Extensions.GrpcService.CallCredentials.FileBasedMetadata.V3.FileBasedMetadataCallCredentials do
  @moduledoc """
  [#not-implemented-hide:]
  [#protodoc-title: File-Based Metadata Call Credentials]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.grpc_service.call_credentials.file_based_metadata.v3.FileBasedMetadataCallCredentials",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :secret_data, 1,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "secretData",
    deprecated: false

  field :header_key, 2, type: :string, json_name: "headerKey"
  field :header_prefix, 3, type: :string, json_name: "headerPrefix"
end

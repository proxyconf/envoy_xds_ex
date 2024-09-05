defmodule Envoy.Config.GrpcCredential.V2alpha.FileBasedMetadataConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :secret_data, 1,
    type: Envoy.Api.V2.Core.DataSource,
    json_name: "secretData",
    deprecated: false

  field :header_key, 2, type: :string, json_name: "headerKey"
  field :header_prefix, 3, type: :string, json_name: "headerPrefix"
end
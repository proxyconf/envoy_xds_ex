defmodule Envoy.Extensions.Filters.Http.CredentialInjector.V3.CredentialInjector do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :overwrite, 1, type: :bool

  field :allow_request_without_credential, 2,
    type: :bool,
    json_name: "allowRequestWithoutCredential"

  field :credential, 3, type: Envoy.Config.Core.V3.TypedExtensionConfig, deprecated: false
end
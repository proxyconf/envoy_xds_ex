defmodule Envoy.Extensions.Http.InjectedCredentials.Generic.V3.Generic do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :credential, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig,
    deprecated: false

  field :header, 2, type: :string, deprecated: false
end
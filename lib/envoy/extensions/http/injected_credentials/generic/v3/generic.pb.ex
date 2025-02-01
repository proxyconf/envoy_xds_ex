defmodule Envoy.Extensions.Http.InjectedCredentials.Generic.V3.Generic do
  @moduledoc """
  Generic extension can be used to inject HTTP Basic Auth, Bearer Token, or any arbitrary credential
  into the proxied requests.
  The credential will be injected into the specified HTTP request header.
  Refer to [RFC 6750: The OAuth 2.0 Authorization Framework: Bearer Token Usage](https://www.rfc-editor.org/rfc/rfc6750) for details.
  [#protodoc-title: Generic Credential]
  [#extension: envoy.http.injected_credentials.generic]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :credential, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig,
    deprecated: false

  field :header, 2, type: :string, deprecated: false
end

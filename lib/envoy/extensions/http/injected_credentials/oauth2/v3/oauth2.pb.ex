defmodule Envoy.Extensions.Http.InjectedCredentials.Oauth2.V3.OAuth2.AuthType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :BASIC_AUTH, 0
  field :URL_ENCODED_BODY, 1
end

defmodule Envoy.Extensions.Http.InjectedCredentials.Oauth2.V3.OAuth2.ClientCredentials do
  @moduledoc """
  Credentials to authenticate client to the authorization server.
  Refer to [RFC 6749: The OAuth 2.0 Authorization Framework](https://www.rfc-editor.org/rfc/rfc6749#section-2.3) for details.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :client_id, 1, type: :string, json_name: "clientId", deprecated: false

  field :client_secret, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig,
    json_name: "clientSecret",
    deprecated: false

  field :auth_type, 3,
    type: Envoy.Extensions.Http.InjectedCredentials.Oauth2.V3.OAuth2.AuthType,
    json_name: "authType",
    enum: true
end

defmodule Envoy.Extensions.Http.InjectedCredentials.Oauth2.V3.OAuth2 do
  @moduledoc """
  OAuth2 extension can be used to retrieve an OAuth2 access token from an authorization server and inject it into the
  proxied requests.
  Currently, only the Client Credentials Grant flow is supported.
  The access token will be injected into the request headers using the ``Authorization`` header as a bearer token.
  [#protodoc-title: OAuth2 Credential]
  [#extension: envoy.http.injected_credentials.oauth2]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :flow_type, 0

  field :token_endpoint, 1,
    type: Envoy.Config.Core.V3.HttpUri,
    json_name: "tokenEndpoint",
    deprecated: false

  field :scopes, 2, repeated: true, type: :string

  field :client_credentials, 3,
    type: Envoy.Extensions.Http.InjectedCredentials.Oauth2.V3.OAuth2.ClientCredentials,
    json_name: "clientCredentials",
    oneof: 0

  field :token_fetch_retry_interval, 4,
    type: Google.Protobuf.Duration,
    json_name: "tokenFetchRetryInterval",
    deprecated: false
end

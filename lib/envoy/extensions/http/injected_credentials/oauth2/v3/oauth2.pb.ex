defmodule Envoy.Extensions.Http.InjectedCredentials.Oauth2.V3.OAuth2.AuthType do
  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.http.injected_credentials.oauth2.v3.OAuth2.AuthType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :BASIC_AUTH, 0
  field :URL_ENCODED_BODY, 1
end

defmodule Envoy.Extensions.Http.InjectedCredentials.Oauth2.V3.OAuth2.ClientCredentials do
  @moduledoc """
  Credentials to authenticate client to the authorization server.
  Refer to [RFC 6749: The OAuth 2.0 Authorization Framework](https://www.rfc-editor.org/rfc/rfc6749#section-2.3) for details.
  """

  use Protobuf,
    full_name: "envoy.extensions.http.injected_credentials.oauth2.v3.OAuth2.ClientCredentials",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

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

defmodule Envoy.Extensions.Http.InjectedCredentials.Oauth2.V3.OAuth2.EndpointParameter do
  @moduledoc """
  Optional additional parameters to include in the token endpoint request body.
  These parameters will be URL-encoded and added to the request body along with the standard OAuth2 parameters.
  Refer to your authorization server's documentation for supported parameters.
  """

  use Protobuf,
    full_name: "envoy.extensions.http.injected_credentials.oauth2.v3.OAuth2.EndpointParameter",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :value, 2, type: :string
end

defmodule Envoy.Extensions.Http.InjectedCredentials.Oauth2.V3.OAuth2 do
  @moduledoc """
  OAuth2 extension can be used to retrieve an OAuth2 access token from an authorization server and inject it into the
  proxied requests.
  Currently, only the Client Credentials Grant flow is supported.
  The access token will be injected into the request headers using the ``Authorization`` header as a bearer token.
  [#next-free-field: 6]
  [#protodoc-title: OAuth2 Credential]
  [#extension: envoy.http.injected_credentials.oauth2]
  """

  use Protobuf,
    full_name: "envoy.extensions.http.injected_credentials.oauth2.v3.OAuth2",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

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

  field :endpoint_params, 5,
    repeated: true,
    type: Envoy.Extensions.Http.InjectedCredentials.Oauth2.V3.OAuth2.EndpointParameter,
    json_name: "endpointParams"
end

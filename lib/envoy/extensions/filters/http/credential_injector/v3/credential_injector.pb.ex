defmodule Envoy.Extensions.Filters.Http.CredentialInjector.V3.CredentialInjector do
  @moduledoc """
  Credential Injector injects credentials into outgoing HTTP requests. The filter configuration is used to retrieve the credentials, or
  they can be requested through the OAuth2 client credential grant. The credentials obtained are then injected into the Authorization header
  of the proxied HTTP requests, utilizing either the Basic or Bearer scheme.

  If the credential is not present or there was a failure injecting the credential, the request will fail with ``401 Unauthorized`` unless
  ``allow_request_without_credential`` is set to ``true``.

  Notice: This filter is intended to be used for workload authentication, which means that the identity associated with the inserted credential
  is considered as the identity of the workload behind the envoy proxy(in this case, envoy is typically deployed as a sidecar alongside that
  workload). Please note that this filter does not handle end user authentication. Its purpose is solely to authenticate the workload itself.

  Here is an example of CredentialInjector configuration with Generic credential, which injects an HTTP Basic Auth credential into the proxied requests.

  .. code-block:: yaml

  overwrite: true
  credential:
  name: generic_credential
  typed_config:
  "@type": type.googleapis.com/envoy.extensions.http.injected_credentials.generic.v3.Generic
  credential:
  name: credential
  sds_config:
  path_config_source:
  path: credential.yaml
  header: Authorization

  credential.yaml for Basic Auth:

  .. code-block:: yaml

  resources:
  - "@type": "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.Secret"
  name: credential
  generic_secret:
  secret:
  inline_string: "Basic base64EncodedUsernamePassword"

  It can also be configured to inject a Bearer token into the proxied requests.

  credential.yaml for Bearer Token:

  .. code-block:: yaml

  resources:
  - "@type": "type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.Secret"
  name: credential
  generic_secret:
  secret:
  inline_string: "Bearer myToken"
  [#protodoc-title: Credential Injector]
  Credential Injector :ref:`configuration overview <config_http_filters_credential_injector>`.
  [#extension: envoy.filters.http.credential_injector]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :overwrite, 1, type: :bool

  field :allow_request_without_credential, 2,
    type: :bool,
    json_name: "allowRequestWithoutCredential"

  field :credential, 3, type: Envoy.Config.Core.V3.TypedExtensionConfig, deprecated: false
end

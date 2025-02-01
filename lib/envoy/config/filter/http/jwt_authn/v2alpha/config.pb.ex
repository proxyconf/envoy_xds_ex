defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtProvider do
  @moduledoc """
  Please see following for JWT authentication flow:

  * `JSON Web Token (JWT) <https://tools.ietf.org/html/rfc7519>`_
  * `The OAuth 2.0 Authorization Framework <https://tools.ietf.org/html/rfc6749>`_
  * `OpenID Connect <http://openid.net/connect>`_

  A JwtProvider message specifies how a JSON Web Token (JWT) can be verified. It specifies:

  * issuer: the principal that issues the JWT. It has to match the one from the token.
  * allowed audiences: the ones in the token have to be listed here.
  * how to fetch public key JWKS to verify the token signature.
  * how to extract JWT token in the request.
  * how to pass successfully verified token payload.

  Example:

  .. code-block:: yaml

  issuer: https://example.com
  audiences:
  - bookstore_android.apps.googleusercontent.com
  - bookstore_web.apps.googleusercontent.com
  remote_jwks:
  http_uri:
  uri: https://example.com/.well-known/jwks.json
  cluster: example_jwks_cluster
  cache_duration:
  seconds: 300

  [#next-free-field: 10]
  [#protodoc-title: JWT Authentication]
  JWT Authentication :ref:`configuration overview <config_http_filters_jwt_authn>`.
  [#extension: envoy.filters.http.jwt_authn]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :jwks_source_specifier, 0

  field :issuer, 1, type: :string, deprecated: false
  field :audiences, 2, repeated: true, type: :string

  field :remote_jwks, 3,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RemoteJwks,
    json_name: "remoteJwks",
    oneof: 0

  field :local_jwks, 4, type: Envoy.Api.V2.Core.DataSource, json_name: "localJwks", oneof: 0
  field :forward, 5, type: :bool

  field :from_headers, 6,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtHeader,
    json_name: "fromHeaders"

  field :from_params, 7, repeated: true, type: :string, json_name: "fromParams"
  field :forward_payload_header, 8, type: :string, json_name: "forwardPayloadHeader"
  field :payload_in_metadata, 9, type: :string, json_name: "payloadInMetadata"
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RemoteJwks do
  @moduledoc """
  This message specifies how to fetch JWKS from remote and how to cache it.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :http_uri, 1, type: Envoy.Api.V2.Core.HttpUri, json_name: "httpUri"
  field :cache_duration, 2, type: Google.Protobuf.Duration, json_name: "cacheDuration"
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtHeader do
  @moduledoc """
  This message specifies a header location to extract JWT token.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :value_prefix, 2, type: :string, json_name: "valuePrefix"
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.ProviderWithAudiences do
  @moduledoc """
  Specify a required provider with audiences.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :provider_name, 1, type: :string, json_name: "providerName"
  field :audiences, 2, repeated: true, type: :string
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement do
  @moduledoc """
  This message specifies a Jwt requirement. An empty message means JWT verification is not
  required. Here are some config examples:

  .. code-block:: yaml

  # Example 1: not required with an empty message

  # Example 2: require A
  provider_name: provider-A

  # Example 3: require A or B
  requires_any:
  requirements:
  - provider_name: provider-A
  - provider_name: provider-B

  # Example 4: require A and B
  requires_all:
  requirements:
  - provider_name: provider-A
  - provider_name: provider-B

  # Example 5: require A and (B or C)
  requires_all:
  requirements:
  - provider_name: provider-A
  - requires_any:
  requirements:
  - provider_name: provider-B
  - provider_name: provider-C

  # Example 6: require A or (B and C)
  requires_any:
  requirements:
  - provider_name: provider-A
  - requires_all:
  requirements:
  - provider_name: provider-B
  - provider_name: provider-C

  # Example 7: A is optional (if token from A is provided, it must be valid, but also allows
  missing token.)
  requires_any:
  requirements:
  - provider_name: provider-A
  - allow_missing: {}

  # Example 8: A is optional and B is required.
  requires_all:
  requirements:
  - requires_any:
  requirements:
  - provider_name: provider-A
  - allow_missing: {}
  - provider_name: provider-B

  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :requires_type, 0

  field :provider_name, 1, type: :string, json_name: "providerName", oneof: 0

  field :provider_and_audiences, 2,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.ProviderWithAudiences,
    json_name: "providerAndAudiences",
    oneof: 0

  field :requires_any, 3,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirementOrList,
    json_name: "requiresAny",
    oneof: 0

  field :requires_all, 4,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirementAndList,
    json_name: "requiresAll",
    oneof: 0

  field :allow_missing_or_failed, 5,
    type: Google.Protobuf.Empty,
    json_name: "allowMissingOrFailed",
    oneof: 0

  field :allow_missing, 6, type: Google.Protobuf.Empty, json_name: "allowMissing", oneof: 0
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirementOrList do
  @moduledoc """
  This message specifies a list of RequiredProvider.
  Their results are OR-ed; if any one of them passes, the result is passed
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :requirements, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement,
    deprecated: false
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirementAndList do
  @moduledoc """
  This message specifies a list of RequiredProvider.
  Their results are AND-ed; all of them must pass, if one of them fails or missing, it fails.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :requirements, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement,
    deprecated: false
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RequirementRule do
  @moduledoc """
  This message specifies a Jwt requirement for a specific Route condition.
  Example 1:

  .. code-block:: yaml

  - match:
  prefix: /healthz

  In above example, "requires" field is empty for /healthz prefix match,
  it means that requests matching the path prefix don't require JWT authentication.

  Example 2:

  .. code-block:: yaml

  - match:
  prefix: /
  requires: { provider_name: provider-A }

  In above example, all requests matched the path prefix require jwt authentication
  from "provider-A".
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :match, 1, type: Envoy.Api.V2.Route.RouteMatch, deprecated: false
  field :requires, 2, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule.RequiresEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule do
  @moduledoc """
  This message specifies Jwt requirements based on stream_info.filterState.
  This FilterState should use `Router::StringAccessor` object to set a string value.
  Other HTTP filters can use it to specify Jwt requirements dynamically.

  Example:

  .. code-block:: yaml

  name: jwt_selector
  requires:
  issuer_1:
  provider_name: issuer1
  issuer_2:
  provider_name: issuer2

  If a filter set "jwt_selector" with "issuer_1" to FilterState for a request,
  jwt_authn filter will use JwtRequirement{"provider_name": "issuer1"} to verify.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false

  field :requires, 3,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule.RequiresEntry,
    map: true
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtAuthentication.ProvidersEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtProvider
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtAuthentication do
  @moduledoc """
  This is the Envoy HTTP filter config for JWT authentication.

  For example:

  .. code-block:: yaml

  providers:
  provider1:
  issuer: issuer1
  audiences:
  - audience1
  - audience2
  remote_jwks:
  http_uri:
  uri: https://example.com/.well-known/jwks.json
  cluster: example_jwks_cluster
  provider2:
  issuer: issuer2
  local_jwks:
  inline_string: jwks_string

  rules:
  # Not jwt verification is required for /health path
  - match:
  prefix: /health

  # Jwt verification for provider1 is required for path prefixed with "prefix"
  - match:
  prefix: /prefix
  requires:
  provider_name: provider1

  # Jwt verification for either provider1 or provider2 is required for all other requests.
  - match:
  prefix: /
  requires:
  requires_any:
  requirements:
  - provider_name: provider1
  - provider_name: provider2
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :providers, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtAuthentication.ProvidersEntry,
    map: true

  field :rules, 2, repeated: true, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RequirementRule

  field :filter_state_rules, 3,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule,
    json_name: "filterStateRules"

  field :bypass_cors_preflight, 4, type: :bool, json_name: "bypassCorsPreflight"
end

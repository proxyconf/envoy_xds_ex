defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.ExtAuthz do
  @moduledoc """
  [#next-free-field: 12]
  [#protodoc-title: External Authorization]
  External Authorization :ref:`configuration overview <config_http_filters_ext_authz>`.
  [#extension: envoy.filters.http.ext_authz]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :services, 0

  field :grpc_service, 1, type: Envoy.Api.V2.Core.GrpcService, json_name: "grpcService", oneof: 0

  field :http_service, 3,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.HttpService,
    json_name: "httpService",
    oneof: 0

  field :failure_mode_allow, 2, type: :bool, json_name: "failureModeAllow"
  field :use_alpha, 4, type: :bool, json_name: "useAlpha", deprecated: true

  field :with_request_body, 5,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.BufferSettings,
    json_name: "withRequestBody"

  field :clear_route_cache, 6, type: :bool, json_name: "clearRouteCache"
  field :status_on_error, 7, type: Envoy.Type.HttpStatus, json_name: "statusOnError"

  field :metadata_context_namespaces, 8,
    repeated: true,
    type: :string,
    json_name: "metadataContextNamespaces"

  field :filter_enabled, 9,
    type: Envoy.Api.V2.Core.RuntimeFractionalPercent,
    json_name: "filterEnabled"

  field :deny_at_disable, 11,
    type: Envoy.Api.V2.Core.RuntimeFeatureFlag,
    json_name: "denyAtDisable"

  field :include_peer_certificate, 10, type: :bool, json_name: "includePeerCertificate"
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.BufferSettings do
  @moduledoc """
  Configuration for buffering the request data.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :max_request_bytes, 1, type: :uint32, json_name: "maxRequestBytes", deprecated: false
  field :allow_partial_message, 2, type: :bool, json_name: "allowPartialMessage"
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.HttpService do
  @moduledoc """
  HttpService is used for raw HTTP communication between the filter and the authorization service.
  When configured, the filter will parse the client request and use these attributes to call the
  authorization server. Depending on the response, the filter may reject or accept the client
  request. Note that in any of these events, metadata can be added, removed or overridden by the
  filter:

  *On authorization request*, a list of allowed request headers may be supplied. See
  :ref:`allowed_headers
  <envoy_api_field_config.filter.http.ext_authz.v2.AuthorizationRequest.allowed_headers>`
  for details. Additional headers metadata may be added to the authorization request. See
  :ref:`headers_to_add
  <envoy_api_field_config.filter.http.ext_authz.v2.AuthorizationRequest.headers_to_add>` for
  details.

  On authorization response status HTTP 200 OK, the filter will allow traffic to the upstream and
  additional headers metadata may be added to the original client request. See
  :ref:`allowed_upstream_headers
  <envoy_api_field_config.filter.http.ext_authz.v2.AuthorizationResponse.allowed_upstream_headers>`
  for details.

  On other authorization response statuses, the filter will not allow traffic. Additional headers
  metadata as well as body may be added to the client's response. See :ref:`allowed_client_headers
  <envoy_api_field_config.filter.http.ext_authz.v2.AuthorizationResponse.allowed_client_headers>`
  for details.
  [#next-free-field: 9]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :server_uri, 1, type: Envoy.Api.V2.Core.HttpUri, json_name: "serverUri"
  field :path_prefix, 2, type: :string, json_name: "pathPrefix"

  field :authorization_request, 7,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationRequest,
    json_name: "authorizationRequest"

  field :authorization_response, 8,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationResponse,
    json_name: "authorizationResponse"
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationRequest do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :allowed_headers, 1,
    type: Envoy.Type.Matcher.ListStringMatcher,
    json_name: "allowedHeaders"

  field :headers_to_add, 2,
    repeated: true,
    type: Envoy.Api.V2.Core.HeaderValue,
    json_name: "headersToAdd"
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.AuthorizationResponse do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :allowed_upstream_headers, 1,
    type: Envoy.Type.Matcher.ListStringMatcher,
    json_name: "allowedUpstreamHeaders"

  field :allowed_client_headers, 2,
    type: Envoy.Type.Matcher.ListStringMatcher,
    json_name: "allowedClientHeaders"
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.ExtAuthzPerRoute do
  @moduledoc """
  Extra settings on a per virtualhost/route/weighted-cluster level.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :override, 0

  field :disabled, 1, type: :bool, oneof: 0, deprecated: false

  field :check_settings, 2,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.CheckSettings,
    json_name: "checkSettings",
    oneof: 0,
    deprecated: false
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.CheckSettings.ContextExtensionsEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Config.Filter.Http.ExtAuthz.V2.CheckSettings do
  @moduledoc """
  Extra settings for the check request. You can use this to provide extra context for the
  external authorization server on specific virtual hosts \ routes. For example, adding a context
  extension on the virtual host level can give the ext-authz server information on what virtual
  host is used without needing to parse the host header. If CheckSettings is specified in multiple
  per-filter-configs, they will be merged in order, and the result will be used.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :context_extensions, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.ExtAuthz.V2.CheckSettings.ContextExtensionsEntry,
    json_name: "contextExtensions",
    map: true
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.ExtAuthz do
  @moduledoc """
  [#next-free-field: 30]
  [#protodoc-title: External Authorization]
  External Authorization :ref:`configuration overview <config_http_filters_ext_authz>`.
  [#extension: envoy.filters.http.ext_authz]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :services, 0

  field :grpc_service, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    oneof: 0

  field :http_service, 3,
    type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.HttpService,
    json_name: "httpService",
    oneof: 0

  field :transport_api_version, 12,
    type: Envoy.Config.Core.V3.ApiVersion,
    json_name: "transportApiVersion",
    enum: true,
    deprecated: false

  field :failure_mode_allow, 2, type: :bool, json_name: "failureModeAllow"
  field :failure_mode_allow_header_add, 19, type: :bool, json_name: "failureModeAllowHeaderAdd"

  field :with_request_body, 5,
    type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.BufferSettings,
    json_name: "withRequestBody"

  field :clear_route_cache, 6, type: :bool, json_name: "clearRouteCache"
  field :status_on_error, 7, type: Envoy.Type.V3.HttpStatus, json_name: "statusOnError"
  field :validate_mutations, 24, type: :bool, json_name: "validateMutations"

  field :metadata_context_namespaces, 8,
    repeated: true,
    type: :string,
    json_name: "metadataContextNamespaces"

  field :typed_metadata_context_namespaces, 16,
    repeated: true,
    type: :string,
    json_name: "typedMetadataContextNamespaces"

  field :route_metadata_context_namespaces, 21,
    repeated: true,
    type: :string,
    json_name: "routeMetadataContextNamespaces"

  field :route_typed_metadata_context_namespaces, 22,
    repeated: true,
    type: :string,
    json_name: "routeTypedMetadataContextNamespaces"

  field :filter_enabled, 9,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "filterEnabled"

  field :filter_enabled_metadata, 14,
    type: Envoy.Type.Matcher.V3.MetadataMatcher,
    json_name: "filterEnabledMetadata"

  field :deny_at_disable, 11,
    type: Envoy.Config.Core.V3.RuntimeFeatureFlag,
    json_name: "denyAtDisable"

  field :include_peer_certificate, 10, type: :bool, json_name: "includePeerCertificate"
  field :stat_prefix, 13, type: :string, json_name: "statPrefix"
  field :bootstrap_metadata_labels_key, 15, type: :string, json_name: "bootstrapMetadataLabelsKey"

  field :allowed_headers, 17,
    type: Envoy.Type.Matcher.V3.ListStringMatcher,
    json_name: "allowedHeaders"

  field :disallowed_headers, 25,
    type: Envoy.Type.Matcher.V3.ListStringMatcher,
    json_name: "disallowedHeaders"

  field :include_tls_session, 18, type: :bool, json_name: "includeTlsSession"

  field :charge_cluster_response_stats, 20,
    type: Google.Protobuf.BoolValue,
    json_name: "chargeClusterResponseStats"

  field :encode_raw_headers, 23, type: :bool, json_name: "encodeRawHeaders"

  field :decoder_header_mutation_rules, 26,
    type: Envoy.Config.Common.MutationRules.V3.HeaderMutationRules,
    json_name: "decoderHeaderMutationRules"

  field :enable_dynamic_metadata_ingestion, 27,
    type: Google.Protobuf.BoolValue,
    json_name: "enableDynamicMetadataIngestion"

  field :filter_metadata, 28, type: Google.Protobuf.Struct, json_name: "filterMetadata"
  field :emit_filter_state_stats, 29, type: :bool, json_name: "emitFilterStateStats"
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.BufferSettings do
  @moduledoc """
  Configuration for buffering the request data.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :max_request_bytes, 1, type: :uint32, json_name: "maxRequestBytes", deprecated: false
  field :allow_partial_message, 2, type: :bool, json_name: "allowPartialMessage"
  field :pack_as_bytes, 3, type: :bool, json_name: "packAsBytes"
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.HttpService do
  @moduledoc """
  HttpService is used for raw HTTP communication between the filter and the authorization service.
  When configured, the filter will parse the client request and use these attributes to call the
  authorization server. Depending on the response, the filter may reject or accept the client
  request. Note that in any of these events, metadata can be added, removed or overridden by the
  filter:

  *On authorization request*, a list of allowed request headers may be supplied. See
  :ref:`allowed_headers
  <envoy_v3_api_field_extensions.filters.http.ext_authz.v3.AuthorizationRequest.allowed_headers>`
  for details. Additional headers metadata may be added to the authorization request. See
  :ref:`headers_to_add
  <envoy_v3_api_field_extensions.filters.http.ext_authz.v3.AuthorizationRequest.headers_to_add>` for
  details.

  On authorization response status HTTP 200 OK, the filter will allow traffic to the upstream and
  additional headers metadata may be added to the original client request. See
  :ref:`allowed_upstream_headers
  <envoy_v3_api_field_extensions.filters.http.ext_authz.v3.AuthorizationResponse.allowed_upstream_headers>`
  for details. Additionally, the filter may add additional headers to the client's response. See
  :ref:`allowed_client_headers_on_success
  <envoy_v3_api_field_extensions.filters.http.ext_authz.v3.AuthorizationResponse.allowed_client_headers_on_success>`
  for details.

  On other authorization response statuses, the filter will not allow traffic. Additional headers
  metadata as well as body may be added to the client's response. See :ref:`allowed_client_headers
  <envoy_v3_api_field_extensions.filters.http.ext_authz.v3.AuthorizationResponse.allowed_client_headers>`
  for details.
  [#next-free-field: 9]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :server_uri, 1, type: Envoy.Config.Core.V3.HttpUri, json_name: "serverUri"
  field :path_prefix, 2, type: :string, json_name: "pathPrefix"

  field :authorization_request, 7,
    type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.AuthorizationRequest,
    json_name: "authorizationRequest"

  field :authorization_response, 8,
    type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.AuthorizationResponse,
    json_name: "authorizationResponse"
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.AuthorizationRequest do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :allowed_headers, 1,
    type: Envoy.Type.Matcher.V3.ListStringMatcher,
    json_name: "allowedHeaders",
    deprecated: true

  field :headers_to_add, 2,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValue,
    json_name: "headersToAdd"
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.AuthorizationResponse do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :allowed_upstream_headers, 1,
    type: Envoy.Type.Matcher.V3.ListStringMatcher,
    json_name: "allowedUpstreamHeaders"

  field :allowed_upstream_headers_to_append, 3,
    type: Envoy.Type.Matcher.V3.ListStringMatcher,
    json_name: "allowedUpstreamHeadersToAppend"

  field :allowed_client_headers, 2,
    type: Envoy.Type.Matcher.V3.ListStringMatcher,
    json_name: "allowedClientHeaders"

  field :allowed_client_headers_on_success, 4,
    type: Envoy.Type.Matcher.V3.ListStringMatcher,
    json_name: "allowedClientHeadersOnSuccess"

  field :dynamic_metadata_from_headers, 5,
    type: Envoy.Type.Matcher.V3.ListStringMatcher,
    json_name: "dynamicMetadataFromHeaders"
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.ExtAuthzPerRoute do
  @moduledoc """
  Extra settings on a per virtualhost/route/weighted-cluster level.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :override, 0

  field :disabled, 1, type: :bool, oneof: 0, deprecated: false

  field :check_settings, 2,
    type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.CheckSettings,
    json_name: "checkSettings",
    oneof: 0,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.CheckSettings.ContextExtensionsEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Extensions.Filters.Http.ExtAuthz.V3.CheckSettings do
  @moduledoc """
  Extra settings for the check request.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :context_extensions, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.CheckSettings.ContextExtensionsEntry,
    json_name: "contextExtensions",
    map: true,
    deprecated: false

  field :disable_request_body_buffering, 2, type: :bool, json_name: "disableRequestBodyBuffering"

  field :with_request_body, 3,
    type: Envoy.Extensions.Filters.Http.ExtAuthz.V3.BufferSettings,
    json_name: "withRequestBody"
end

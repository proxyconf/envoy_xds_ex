defmodule Envoy.Api.V2.Route.VirtualHost.TlsRequirementType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :NONE, 0
  field :EXTERNAL_ONLY, 1
  field :ALL, 2
end

defmodule Envoy.Api.V2.Route.RouteAction.ClusterNotFoundResponseCode do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :SERVICE_UNAVAILABLE, 0
  field :NOT_FOUND, 1
end

defmodule Envoy.Api.V2.Route.RouteAction.InternalRedirectAction do
  @moduledoc """
  Configures :ref:`internal redirect <arch_overview_internal_redirects>` behavior.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :PASS_THROUGH_INTERNAL_REDIRECT, 0
  field :HANDLE_INTERNAL_REDIRECT, 1
end

defmodule Envoy.Api.V2.Route.RedirectAction.RedirectResponseCode do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :MOVED_PERMANENTLY, 0
  field :FOUND, 1
  field :SEE_OTHER, 2
  field :TEMPORARY_REDIRECT, 3
  field :PERMANENT_REDIRECT, 4
end

defmodule Envoy.Api.V2.Route.VirtualHost.PerFilterConfigEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Api.V2.Route.VirtualHost.TypedPerFilterConfigEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Api.V2.Route.VirtualHost do
  @moduledoc """
  The top level element in the routing configuration is a virtual host. Each virtual host has
  a logical name as well as a set of domains that get routed to it based on the incoming request's
  host header. This allows a single listener to service multiple top level domain path trees. Once
  a virtual host is selected based on the domain, the routes are processed in order to see which
  upstream cluster to route to or whether to perform a redirect.
  [#next-free-field: 21]
  [#protodoc-title: HTTP route components]
  * Routing :ref:`architecture overview <arch_overview_http_routing>`
  * HTTP :ref:`router filter <config_http_filters_router>`
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :domains, 2, repeated: true, type: :string, deprecated: false
  field :routes, 3, repeated: true, type: Envoy.Api.V2.Route.Route

  field :require_tls, 4,
    type: Envoy.Api.V2.Route.VirtualHost.TlsRequirementType,
    json_name: "requireTls",
    enum: true,
    deprecated: false

  field :virtual_clusters, 5,
    repeated: true,
    type: Envoy.Api.V2.Route.VirtualCluster,
    json_name: "virtualClusters"

  field :rate_limits, 6,
    repeated: true,
    type: Envoy.Api.V2.Route.RateLimit,
    json_name: "rateLimits"

  field :request_headers_to_add, 7,
    repeated: true,
    type: Envoy.Api.V2.Core.HeaderValueOption,
    json_name: "requestHeadersToAdd",
    deprecated: false

  field :request_headers_to_remove, 13,
    repeated: true,
    type: :string,
    json_name: "requestHeadersToRemove"

  field :response_headers_to_add, 10,
    repeated: true,
    type: Envoy.Api.V2.Core.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :response_headers_to_remove, 11,
    repeated: true,
    type: :string,
    json_name: "responseHeadersToRemove"

  field :cors, 8, type: Envoy.Api.V2.Route.CorsPolicy

  field :per_filter_config, 12,
    repeated: true,
    type: Envoy.Api.V2.Route.VirtualHost.PerFilterConfigEntry,
    json_name: "perFilterConfig",
    map: true,
    deprecated: true

  field :typed_per_filter_config, 15,
    repeated: true,
    type: Envoy.Api.V2.Route.VirtualHost.TypedPerFilterConfigEntry,
    json_name: "typedPerFilterConfig",
    map: true

  field :include_request_attempt_count, 14, type: :bool, json_name: "includeRequestAttemptCount"

  field :include_attempt_count_in_response, 19,
    type: :bool,
    json_name: "includeAttemptCountInResponse"

  field :retry_policy, 16, type: Envoy.Api.V2.Route.RetryPolicy, json_name: "retryPolicy"

  field :retry_policy_typed_config, 20,
    type: Google.Protobuf.Any,
    json_name: "retryPolicyTypedConfig"

  field :hedge_policy, 17, type: Envoy.Api.V2.Route.HedgePolicy, json_name: "hedgePolicy"

  field :per_request_buffer_limit_bytes, 18,
    type: Google.Protobuf.UInt32Value,
    json_name: "perRequestBufferLimitBytes"
end

defmodule Envoy.Api.V2.Route.FilterAction do
  @moduledoc """
  A filter-defined action type.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :action, 1, type: Google.Protobuf.Any
end

defmodule Envoy.Api.V2.Route.Route.PerFilterConfigEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Api.V2.Route.Route.TypedPerFilterConfigEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Api.V2.Route.Route do
  @moduledoc """
  A route is both a specification of how to match a request as well as an indication of what to do
  next (e.g., redirect, forward, rewrite, etc.).

  .. attention::

  Envoy supports routing on HTTP method via :ref:`header matching
  <envoy_api_msg_route.HeaderMatcher>`.
  [#next-free-field: 18]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :action, 0

  field :name, 14, type: :string
  field :match, 1, type: Envoy.Api.V2.Route.RouteMatch, deprecated: false
  field :route, 2, type: Envoy.Api.V2.Route.RouteAction, oneof: 0
  field :redirect, 3, type: Envoy.Api.V2.Route.RedirectAction, oneof: 0

  field :direct_response, 7,
    type: Envoy.Api.V2.Route.DirectResponseAction,
    json_name: "directResponse",
    oneof: 0

  field :filter_action, 17,
    type: Envoy.Api.V2.Route.FilterAction,
    json_name: "filterAction",
    oneof: 0

  field :metadata, 4, type: Envoy.Api.V2.Core.Metadata
  field :decorator, 5, type: Envoy.Api.V2.Route.Decorator

  field :per_filter_config, 8,
    repeated: true,
    type: Envoy.Api.V2.Route.Route.PerFilterConfigEntry,
    json_name: "perFilterConfig",
    map: true,
    deprecated: true

  field :typed_per_filter_config, 13,
    repeated: true,
    type: Envoy.Api.V2.Route.Route.TypedPerFilterConfigEntry,
    json_name: "typedPerFilterConfig",
    map: true

  field :request_headers_to_add, 9,
    repeated: true,
    type: Envoy.Api.V2.Core.HeaderValueOption,
    json_name: "requestHeadersToAdd",
    deprecated: false

  field :request_headers_to_remove, 12,
    repeated: true,
    type: :string,
    json_name: "requestHeadersToRemove"

  field :response_headers_to_add, 10,
    repeated: true,
    type: Envoy.Api.V2.Core.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :response_headers_to_remove, 11,
    repeated: true,
    type: :string,
    json_name: "responseHeadersToRemove"

  field :tracing, 15, type: Envoy.Api.V2.Route.Tracing

  field :per_request_buffer_limit_bytes, 16,
    type: Google.Protobuf.UInt32Value,
    json_name: "perRequestBufferLimitBytes"
end

defmodule Envoy.Api.V2.Route.WeightedCluster.ClusterWeight.PerFilterConfigEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Api.V2.Route.WeightedCluster.ClusterWeight.TypedPerFilterConfigEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Api.V2.Route.WeightedCluster.ClusterWeight do
  @moduledoc """
  [#next-free-field: 11]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :weight, 2, type: Google.Protobuf.UInt32Value
  field :metadata_match, 3, type: Envoy.Api.V2.Core.Metadata, json_name: "metadataMatch"

  field :request_headers_to_add, 4,
    repeated: true,
    type: Envoy.Api.V2.Core.HeaderValueOption,
    json_name: "requestHeadersToAdd",
    deprecated: false

  field :request_headers_to_remove, 9,
    repeated: true,
    type: :string,
    json_name: "requestHeadersToRemove"

  field :response_headers_to_add, 5,
    repeated: true,
    type: Envoy.Api.V2.Core.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :response_headers_to_remove, 6,
    repeated: true,
    type: :string,
    json_name: "responseHeadersToRemove"

  field :per_filter_config, 8,
    repeated: true,
    type: Envoy.Api.V2.Route.WeightedCluster.ClusterWeight.PerFilterConfigEntry,
    json_name: "perFilterConfig",
    map: true,
    deprecated: true

  field :typed_per_filter_config, 10,
    repeated: true,
    type: Envoy.Api.V2.Route.WeightedCluster.ClusterWeight.TypedPerFilterConfigEntry,
    json_name: "typedPerFilterConfig",
    map: true
end

defmodule Envoy.Api.V2.Route.WeightedCluster do
  @moduledoc """
  Compared to the :ref:`cluster <envoy_api_field_route.RouteAction.cluster>` field that specifies a
  single upstream cluster as the target of a request, the :ref:`weighted_clusters
  <envoy_api_field_route.RouteAction.weighted_clusters>` option allows for specification of
  multiple upstream clusters along with weights that indicate the percentage of
  traffic to be forwarded to each cluster. The router selects an upstream cluster based on the
  weights.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :clusters, 1,
    repeated: true,
    type: Envoy.Api.V2.Route.WeightedCluster.ClusterWeight,
    deprecated: false

  field :total_weight, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "totalWeight",
    deprecated: false

  field :runtime_key_prefix, 2, type: :string, json_name: "runtimeKeyPrefix"
end

defmodule Envoy.Api.V2.Route.RouteMatch.GrpcRouteMatchOptions do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Api.V2.Route.RouteMatch.TlsContextMatchOptions do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :presented, 1, type: Google.Protobuf.BoolValue
  field :validated, 2, type: Google.Protobuf.BoolValue
end

defmodule Envoy.Api.V2.Route.RouteMatch do
  @moduledoc """
  [#next-free-field: 12]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :path_specifier, 0

  field :prefix, 1, type: :string, oneof: 0
  field :path, 2, type: :string, oneof: 0
  field :regex, 3, type: :string, oneof: 0, deprecated: true

  field :safe_regex, 10,
    type: Envoy.Type.Matcher.RegexMatcher,
    json_name: "safeRegex",
    oneof: 0,
    deprecated: false

  field :case_sensitive, 4, type: Google.Protobuf.BoolValue, json_name: "caseSensitive"

  field :runtime_fraction, 9,
    type: Envoy.Api.V2.Core.RuntimeFractionalPercent,
    json_name: "runtimeFraction"

  field :headers, 6, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher

  field :query_parameters, 7,
    repeated: true,
    type: Envoy.Api.V2.Route.QueryParameterMatcher,
    json_name: "queryParameters"

  field :grpc, 8, type: Envoy.Api.V2.Route.RouteMatch.GrpcRouteMatchOptions

  field :tls_context, 11,
    type: Envoy.Api.V2.Route.RouteMatch.TlsContextMatchOptions,
    json_name: "tlsContext"
end

defmodule Envoy.Api.V2.Route.CorsPolicy do
  @moduledoc """
  [#next-free-field: 12]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :enabled_specifier, 0

  field :allow_origin, 1,
    repeated: true,
    type: :string,
    json_name: "allowOrigin",
    deprecated: true

  field :allow_origin_regex, 8,
    repeated: true,
    type: :string,
    json_name: "allowOriginRegex",
    deprecated: true

  field :allow_origin_string_match, 11,
    repeated: true,
    type: Envoy.Type.Matcher.StringMatcher,
    json_name: "allowOriginStringMatch"

  field :allow_methods, 2, type: :string, json_name: "allowMethods"
  field :allow_headers, 3, type: :string, json_name: "allowHeaders"
  field :expose_headers, 4, type: :string, json_name: "exposeHeaders"
  field :max_age, 5, type: :string, json_name: "maxAge"
  field :allow_credentials, 6, type: Google.Protobuf.BoolValue, json_name: "allowCredentials"
  field :enabled, 7, type: Google.Protobuf.BoolValue, oneof: 0, deprecated: true

  field :filter_enabled, 9,
    type: Envoy.Api.V2.Core.RuntimeFractionalPercent,
    json_name: "filterEnabled",
    oneof: 0

  field :shadow_enabled, 10,
    type: Envoy.Api.V2.Core.RuntimeFractionalPercent,
    json_name: "shadowEnabled"
end

defmodule Envoy.Api.V2.Route.RouteAction.RequestMirrorPolicy do
  @moduledoc """
  The router is capable of shadowing traffic from one cluster to another. The current
  implementation is "fire and forget," meaning Envoy will not wait for the shadow cluster to
  respond before returning the response from the primary cluster. All normal statistics are
  collected for the shadow cluster making this feature useful for testing.

  During shadowing, the host/authority header is altered such that *-shadow* is appended. This is
  useful for logging. For example, *cluster1* becomes *cluster1-shadow*.

  .. note::

  Shadowing will not be triggered if the primary cluster does not exist.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cluster, 1, type: :string, deprecated: false
  field :runtime_key, 2, type: :string, json_name: "runtimeKey", deprecated: true

  field :runtime_fraction, 3,
    type: Envoy.Api.V2.Core.RuntimeFractionalPercent,
    json_name: "runtimeFraction"

  field :trace_sampled, 4, type: Google.Protobuf.BoolValue, json_name: "traceSampled"
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy.Header do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy.Cookie do
  @moduledoc """
  Envoy supports two types of cookie affinity:

  1. Passive. Envoy takes a cookie that's present in the cookies header and
  hashes on its value.

  2. Generated. Envoy generates and sets a cookie with an expiration (TTL)
  on the first request from the client in its response to the client,
  based on the endpoint the request gets sent to. The client then
  presents this on the next and all subsequent requests. The hash of
  this is sufficient to ensure these requests get sent to the same
  endpoint. The cookie is generated by hashing the source and
  destination ports and addresses so that multiple independent HTTP2
  streams on the same connection will independently receive the same
  cookie, even if they arrive at the Envoy simultaneously.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :ttl, 2, type: Google.Protobuf.Duration
  field :path, 3, type: :string
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy.ConnectionProperties do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :source_ip, 1, type: :bool, json_name: "sourceIp"
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy.QueryParameter do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy.FilterState do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string, deprecated: false
end

defmodule Envoy.Api.V2.Route.RouteAction.HashPolicy do
  @moduledoc """
  Specifies the route's hashing policy if the upstream cluster uses a hashing :ref:`load balancer
  <arch_overview_load_balancing_types>`.
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :policy_specifier, 0

  field :header, 1, type: Envoy.Api.V2.Route.RouteAction.HashPolicy.Header, oneof: 0
  field :cookie, 2, type: Envoy.Api.V2.Route.RouteAction.HashPolicy.Cookie, oneof: 0

  field :connection_properties, 3,
    type: Envoy.Api.V2.Route.RouteAction.HashPolicy.ConnectionProperties,
    json_name: "connectionProperties",
    oneof: 0

  field :query_parameter, 5,
    type: Envoy.Api.V2.Route.RouteAction.HashPolicy.QueryParameter,
    json_name: "queryParameter",
    oneof: 0

  field :filter_state, 6,
    type: Envoy.Api.V2.Route.RouteAction.HashPolicy.FilterState,
    json_name: "filterState",
    oneof: 0

  field :terminal, 4, type: :bool
end

defmodule Envoy.Api.V2.Route.RouteAction.UpgradeConfig do
  @moduledoc """
  Allows enabling and disabling upgrades on a per-route basis.
  This overrides any enabled/disabled upgrade filter chain specified in the
  HttpConnectionManager
  :ref:`upgrade_configs
  <envoy_api_field_config.filter.network.http_connection_manager.v2.HttpConnectionManager.upgrade_configs>`
  but does not affect any custom filter chain specified there.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :upgrade_type, 1, type: :string, json_name: "upgradeType", deprecated: false
  field :enabled, 2, type: Google.Protobuf.BoolValue
end

defmodule Envoy.Api.V2.Route.RouteAction do
  @moduledoc """
  [#next-free-field: 34]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :cluster_specifier, 0

  oneof :host_rewrite_specifier, 1

  field :cluster, 1, type: :string, oneof: 0, deprecated: false
  field :cluster_header, 2, type: :string, json_name: "clusterHeader", oneof: 0, deprecated: false

  field :weighted_clusters, 3,
    type: Envoy.Api.V2.Route.WeightedCluster,
    json_name: "weightedClusters",
    oneof: 0

  field :cluster_not_found_response_code, 20,
    type: Envoy.Api.V2.Route.RouteAction.ClusterNotFoundResponseCode,
    json_name: "clusterNotFoundResponseCode",
    enum: true,
    deprecated: false

  field :metadata_match, 4, type: Envoy.Api.V2.Core.Metadata, json_name: "metadataMatch"
  field :prefix_rewrite, 5, type: :string, json_name: "prefixRewrite", deprecated: false

  field :regex_rewrite, 32,
    type: Envoy.Type.Matcher.RegexMatchAndSubstitute,
    json_name: "regexRewrite"

  field :host_rewrite, 6, type: :string, json_name: "hostRewrite", oneof: 1, deprecated: false

  field :auto_host_rewrite, 7,
    type: Google.Protobuf.BoolValue,
    json_name: "autoHostRewrite",
    oneof: 1

  field :auto_host_rewrite_header, 29,
    type: :string,
    json_name: "autoHostRewriteHeader",
    oneof: 1,
    deprecated: false

  field :timeout, 8, type: Google.Protobuf.Duration
  field :idle_timeout, 24, type: Google.Protobuf.Duration, json_name: "idleTimeout"
  field :retry_policy, 9, type: Envoy.Api.V2.Route.RetryPolicy, json_name: "retryPolicy"

  field :retry_policy_typed_config, 33,
    type: Google.Protobuf.Any,
    json_name: "retryPolicyTypedConfig"

  field :request_mirror_policy, 10,
    type: Envoy.Api.V2.Route.RouteAction.RequestMirrorPolicy,
    json_name: "requestMirrorPolicy",
    deprecated: true

  field :request_mirror_policies, 30,
    repeated: true,
    type: Envoy.Api.V2.Route.RouteAction.RequestMirrorPolicy,
    json_name: "requestMirrorPolicies"

  field :priority, 11, type: Envoy.Api.V2.Core.RoutingPriority, enum: true, deprecated: false

  field :rate_limits, 13,
    repeated: true,
    type: Envoy.Api.V2.Route.RateLimit,
    json_name: "rateLimits"

  field :include_vh_rate_limits, 14,
    type: Google.Protobuf.BoolValue,
    json_name: "includeVhRateLimits"

  field :hash_policy, 15,
    repeated: true,
    type: Envoy.Api.V2.Route.RouteAction.HashPolicy,
    json_name: "hashPolicy"

  field :cors, 17, type: Envoy.Api.V2.Route.CorsPolicy
  field :max_grpc_timeout, 23, type: Google.Protobuf.Duration, json_name: "maxGrpcTimeout"
  field :grpc_timeout_offset, 28, type: Google.Protobuf.Duration, json_name: "grpcTimeoutOffset"

  field :upgrade_configs, 25,
    repeated: true,
    type: Envoy.Api.V2.Route.RouteAction.UpgradeConfig,
    json_name: "upgradeConfigs"

  field :internal_redirect_action, 26,
    type: Envoy.Api.V2.Route.RouteAction.InternalRedirectAction,
    json_name: "internalRedirectAction",
    enum: true

  field :max_internal_redirects, 31,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxInternalRedirects"

  field :hedge_policy, 27, type: Envoy.Api.V2.Route.HedgePolicy, json_name: "hedgePolicy"
end

defmodule Envoy.Api.V2.Route.RetryPolicy.RetryPriority do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Api.V2.Route.RetryPolicy.RetryHostPredicate do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Api.V2.Route.RetryPolicy.RetryBackOff do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :base_interval, 1,
    type: Google.Protobuf.Duration,
    json_name: "baseInterval",
    deprecated: false

  field :max_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "maxInterval",
    deprecated: false
end

defmodule Envoy.Api.V2.Route.RetryPolicy do
  @moduledoc """
  HTTP retry :ref:`architecture overview <arch_overview_http_routing_retry>`.
  [#next-free-field: 11]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :retry_on, 1, type: :string, json_name: "retryOn"
  field :num_retries, 2, type: Google.Protobuf.UInt32Value, json_name: "numRetries"
  field :per_try_timeout, 3, type: Google.Protobuf.Duration, json_name: "perTryTimeout"

  field :retry_priority, 4,
    type: Envoy.Api.V2.Route.RetryPolicy.RetryPriority,
    json_name: "retryPriority"

  field :retry_host_predicate, 5,
    repeated: true,
    type: Envoy.Api.V2.Route.RetryPolicy.RetryHostPredicate,
    json_name: "retryHostPredicate"

  field :host_selection_retry_max_attempts, 6,
    type: :int64,
    json_name: "hostSelectionRetryMaxAttempts"

  field :retriable_status_codes, 7,
    repeated: true,
    type: :uint32,
    json_name: "retriableStatusCodes"

  field :retry_back_off, 8,
    type: Envoy.Api.V2.Route.RetryPolicy.RetryBackOff,
    json_name: "retryBackOff"

  field :retriable_headers, 9,
    repeated: true,
    type: Envoy.Api.V2.Route.HeaderMatcher,
    json_name: "retriableHeaders"

  field :retriable_request_headers, 10,
    repeated: true,
    type: Envoy.Api.V2.Route.HeaderMatcher,
    json_name: "retriableRequestHeaders"
end

defmodule Envoy.Api.V2.Route.HedgePolicy do
  @moduledoc """
  HTTP request hedging :ref:`architecture overview <arch_overview_http_routing_hedging>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :initial_requests, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "initialRequests",
    deprecated: false

  field :additional_request_chance, 2,
    type: Envoy.Type.FractionalPercent,
    json_name: "additionalRequestChance"

  field :hedge_on_per_try_timeout, 3, type: :bool, json_name: "hedgeOnPerTryTimeout"
end

defmodule Envoy.Api.V2.Route.RedirectAction do
  @moduledoc """
  [#next-free-field: 9]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :scheme_rewrite_specifier, 0

  oneof :path_rewrite_specifier, 1

  field :https_redirect, 4, type: :bool, json_name: "httpsRedirect", oneof: 0
  field :scheme_redirect, 7, type: :string, json_name: "schemeRedirect", oneof: 0
  field :host_redirect, 1, type: :string, json_name: "hostRedirect", deprecated: false
  field :port_redirect, 8, type: :uint32, json_name: "portRedirect"
  field :path_redirect, 2, type: :string, json_name: "pathRedirect", oneof: 1, deprecated: false
  field :prefix_rewrite, 5, type: :string, json_name: "prefixRewrite", oneof: 1, deprecated: false

  field :response_code, 3,
    type: Envoy.Api.V2.Route.RedirectAction.RedirectResponseCode,
    json_name: "responseCode",
    enum: true,
    deprecated: false

  field :strip_query, 6, type: :bool, json_name: "stripQuery"
end

defmodule Envoy.Api.V2.Route.DirectResponseAction do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :status, 1, type: :uint32, deprecated: false
  field :body, 2, type: Envoy.Api.V2.Core.DataSource
end

defmodule Envoy.Api.V2.Route.Decorator do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :operation, 1, type: :string, deprecated: false
  field :propagate, 2, type: Google.Protobuf.BoolValue
end

defmodule Envoy.Api.V2.Route.Tracing do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :client_sampling, 1, type: Envoy.Type.FractionalPercent, json_name: "clientSampling"
  field :random_sampling, 2, type: Envoy.Type.FractionalPercent, json_name: "randomSampling"
  field :overall_sampling, 3, type: Envoy.Type.FractionalPercent, json_name: "overallSampling"

  field :custom_tags, 4,
    repeated: true,
    type: Envoy.Type.Tracing.V2.CustomTag,
    json_name: "customTags"
end

defmodule Envoy.Api.V2.Route.VirtualCluster do
  @moduledoc """
  A virtual cluster is a way of specifying a regex matching rule against
  certain important endpoints such that statistics are generated explicitly for
  the matched requests. The reason this is useful is that when doing
  prefix/path matching Envoy does not always know what the application
  considers to be an endpoint. Thus, it’s impossible for Envoy to generically
  emit per endpoint statistics. However, often systems have highly critical
  endpoints that they wish to get “perfect” statistics on. Virtual cluster
  statistics are perfect in the sense that they are emitted on the downstream
  side such that they include network level failures.

  Documentation for :ref:`virtual cluster statistics <config_http_filters_router_vcluster_stats>`.

  .. note::

  Virtual clusters are a useful tool, but we do not recommend setting up a virtual cluster for
  every application endpoint. This is both not easily maintainable and as well the matching and
  statistics output are not free.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :pattern, 1, type: :string, deprecated: true
  field :headers, 4, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher
  field :name, 2, type: :string, deprecated: false
  field :method, 3, type: Envoy.Api.V2.Core.RequestMethod, enum: true, deprecated: true
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.SourceCluster do
  @moduledoc """
  The following descriptor entry is appended to the descriptor:

  .. code-block:: cpp

  ("source_cluster", "<local service cluster>")

  <local service cluster> is derived from the :option:`--service-cluster` option.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.DestinationCluster do
  @moduledoc """
  The following descriptor entry is appended to the descriptor:

  .. code-block:: cpp

  ("destination_cluster", "<routed target cluster>")

  Once a request matches against a route table rule, a routed cluster is determined by one of
  the following :ref:`route table configuration <envoy_api_msg_RouteConfiguration>`
  settings:

  * :ref:`cluster <envoy_api_field_route.RouteAction.cluster>` indicates the upstream cluster
  to route to.
  * :ref:`weighted_clusters <envoy_api_field_route.RouteAction.weighted_clusters>`
  chooses a cluster randomly from a set of clusters with attributed weight.
  * :ref:`cluster_header <envoy_api_field_route.RouteAction.cluster_header>` indicates which
  header in the request contains the target cluster.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.RequestHeaders do
  @moduledoc """
  The following descriptor entry is appended when a header contains a key that matches the
  *header_name*:

  .. code-block:: cpp

  ("<descriptor_key>", "<header_value_queried_from_header>")
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
  field :descriptor_key, 2, type: :string, json_name: "descriptorKey", deprecated: false
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.RemoteAddress do
  @moduledoc """
  The following descriptor entry is appended to the descriptor and is populated using the
  trusted address from :ref:`x-forwarded-for <config_http_conn_man_headers_x-forwarded-for>`:

  .. code-block:: cpp

  ("remote_address", "<trusted address from x-forwarded-for>")
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.GenericKey do
  @moduledoc """
  The following descriptor entry is appended to the descriptor:

  .. code-block:: cpp

  ("generic_key", "<descriptor_value>")
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :descriptor_value, 1, type: :string, json_name: "descriptorValue", deprecated: false
end

defmodule Envoy.Api.V2.Route.RateLimit.Action.HeaderValueMatch do
  @moduledoc """
  The following descriptor entry is appended to the descriptor:

  .. code-block:: cpp

  ("header_match", "<descriptor_value>")
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :descriptor_value, 1, type: :string, json_name: "descriptorValue", deprecated: false
  field :expect_match, 2, type: Google.Protobuf.BoolValue, json_name: "expectMatch"
  field :headers, 3, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher, deprecated: false
end

defmodule Envoy.Api.V2.Route.RateLimit.Action do
  @moduledoc """
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :action_specifier, 0

  field :source_cluster, 1,
    type: Envoy.Api.V2.Route.RateLimit.Action.SourceCluster,
    json_name: "sourceCluster",
    oneof: 0

  field :destination_cluster, 2,
    type: Envoy.Api.V2.Route.RateLimit.Action.DestinationCluster,
    json_name: "destinationCluster",
    oneof: 0

  field :request_headers, 3,
    type: Envoy.Api.V2.Route.RateLimit.Action.RequestHeaders,
    json_name: "requestHeaders",
    oneof: 0

  field :remote_address, 4,
    type: Envoy.Api.V2.Route.RateLimit.Action.RemoteAddress,
    json_name: "remoteAddress",
    oneof: 0

  field :generic_key, 5,
    type: Envoy.Api.V2.Route.RateLimit.Action.GenericKey,
    json_name: "genericKey",
    oneof: 0

  field :header_value_match, 6,
    type: Envoy.Api.V2.Route.RateLimit.Action.HeaderValueMatch,
    json_name: "headerValueMatch",
    oneof: 0
end

defmodule Envoy.Api.V2.Route.RateLimit do
  @moduledoc """
  Global rate limiting :ref:`architecture overview <arch_overview_global_rate_limit>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :stage, 1, type: Google.Protobuf.UInt32Value, deprecated: false
  field :disable_key, 2, type: :string, json_name: "disableKey"
  field :actions, 3, repeated: true, type: Envoy.Api.V2.Route.RateLimit.Action, deprecated: false
end

defmodule Envoy.Api.V2.Route.HeaderMatcher do
  @moduledoc """
  .. attention::

  Internally, Envoy always uses the HTTP/2 *:authority* header to represent the HTTP/1 *Host*
  header. Thus, if attempting to match on *Host*, match on *:authority* instead.

  .. attention::

  To route on HTTP method, use the special HTTP/2 *:method* header. This works for both
  HTTP/1 and HTTP/2 as Envoy normalizes headers. E.g.,

  .. code-block:: json

  {
  "name": ":method",
  "exact_match": "POST"
  }

  .. attention::
  In the absence of any header match specifier, match will default to :ref:`present_match
  <envoy_api_field_route.HeaderMatcher.present_match>`. i.e, a request that has the :ref:`name
  <envoy_api_field_route.HeaderMatcher.name>` header will match, regardless of the header's
  value.

  [#next-major-version: HeaderMatcher should be refactored to use StringMatcher.]
  [#next-free-field: 12]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :header_match_specifier, 0

  field :name, 1, type: :string, deprecated: false
  field :exact_match, 4, type: :string, json_name: "exactMatch", oneof: 0
  field :regex_match, 5, type: :string, json_name: "regexMatch", oneof: 0, deprecated: true

  field :safe_regex_match, 11,
    type: Envoy.Type.Matcher.RegexMatcher,
    json_name: "safeRegexMatch",
    oneof: 0

  field :range_match, 6, type: Envoy.Type.Int64Range, json_name: "rangeMatch", oneof: 0
  field :present_match, 7, type: :bool, json_name: "presentMatch", oneof: 0
  field :prefix_match, 9, type: :string, json_name: "prefixMatch", oneof: 0, deprecated: false
  field :suffix_match, 10, type: :string, json_name: "suffixMatch", oneof: 0, deprecated: false
  field :invert_match, 8, type: :bool, json_name: "invertMatch"
end

defmodule Envoy.Api.V2.Route.QueryParameterMatcher do
  @moduledoc """
  Query parameter matching treats the query string of a request's :path header
  as an ampersand-separated list of keys and/or key=value elements.
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :query_parameter_match_specifier, 0

  field :name, 1, type: :string, deprecated: false
  field :value, 3, type: :string, deprecated: true
  field :regex, 4, type: Google.Protobuf.BoolValue, deprecated: true

  field :string_match, 5,
    type: Envoy.Type.Matcher.StringMatcher,
    json_name: "stringMatch",
    oneof: 0,
    deprecated: false

  field :present_match, 6, type: :bool, json_name: "presentMatch", oneof: 0
end

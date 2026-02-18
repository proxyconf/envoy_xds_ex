defmodule Envoy.Extensions.Filters.Http.CacheV2.V3.CacheV2Config.KeyCreatorParams do
  @moduledoc """
  [#not-implemented-hide:]
  Modifies cache key creation by restricting which parts of the URL are included.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.cache_v2.v3.CacheV2Config.KeyCreatorParams",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :exclude_scheme, 1, type: :bool, json_name: "excludeScheme"
  field :exclude_host, 2, type: :bool, json_name: "excludeHost"

  field :query_parameters_included, 3,
    repeated: true,
    type: Envoy.Config.Route.V3.QueryParameterMatcher,
    json_name: "queryParametersIncluded"

  field :query_parameters_excluded, 4,
    repeated: true,
    type: Envoy.Config.Route.V3.QueryParameterMatcher,
    json_name: "queryParametersExcluded"
end

defmodule Envoy.Extensions.Filters.Http.CacheV2.V3.CacheV2Config do
  @moduledoc """
  [#extension: envoy.filters.http.cache_v2]
  [#next-free-field: 8]
  [#protodoc-title: HTTP Cache Filter V2]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.cache_v2.v3.CacheV2Config",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :typed_config, 1, type: Google.Protobuf.Any, json_name: "typedConfig"
  field :disabled, 5, type: Google.Protobuf.BoolValue

  field :allowed_vary_headers, 2,
    repeated: true,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "allowedVaryHeaders"

  field :key_creator_params, 3,
    type: Envoy.Extensions.Filters.Http.CacheV2.V3.CacheV2Config.KeyCreatorParams,
    json_name: "keyCreatorParams"

  field :max_body_bytes, 4, type: :uint32, json_name: "maxBodyBytes"

  field :ignore_request_cache_control_header, 6,
    type: :bool,
    json_name: "ignoreRequestCacheControlHeader"

  field :override_upstream_cluster, 7, type: :string, json_name: "overrideUpstreamCluster"
end

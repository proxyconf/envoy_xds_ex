defmodule Envoy.Extensions.Filters.Http.Cors.V3.Cors do
  @moduledoc """
  Cors filter config. Set this in
  :ref:`http_filters <envoy_v3_api_field_extensions.filters.network.http_connection_manager.v3.HttpConnectionManager.http_filters>`
  to enable the CORS filter.

  Please note that the :ref:`CorsPolicy <envoy_v3_api_msg_extensions.filters.http.cors.v3.CorsPolicy>`
  must be configured in the ``RouteConfiguration`` as ``typed_per_filter_config`` at some level to make the filter work.
  [#protodoc-title: Cors]
  CORS Filter :ref:`configuration overview <config_http_filters_cors>`.
  [#extension: envoy.filters.http.cors]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Http.Cors.V3.CorsPolicy do
  @moduledoc """
  Per route configuration for the CORS filter. This configuration should be configured in the ``RouteConfiguration`` as ``typed_per_filter_config`` at some level to
  make the filter work.
  [#next-free-field: 11]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :allow_origin_string_match, 1,
    repeated: true,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "allowOriginStringMatch"

  field :allow_methods, 2, type: :string, json_name: "allowMethods"
  field :allow_headers, 3, type: :string, json_name: "allowHeaders"
  field :expose_headers, 4, type: :string, json_name: "exposeHeaders"
  field :max_age, 5, type: :string, json_name: "maxAge"
  field :allow_credentials, 6, type: Google.Protobuf.BoolValue, json_name: "allowCredentials"

  field :filter_enabled, 7,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "filterEnabled"

  field :shadow_enabled, 8,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "shadowEnabled"

  field :allow_private_network_access, 9,
    type: Google.Protobuf.BoolValue,
    json_name: "allowPrivateNetworkAccess"

  field :forward_not_matching_preflights, 10,
    type: Google.Protobuf.BoolValue,
    json_name: "forwardNotMatchingPreflights"
end

defmodule Envoy.Config.Filter.Http.Csrf.V2.CsrfPolicy do
  @moduledoc """
  CSRF filter config.
  [#protodoc-title: CSRF]
  Cross-Site Request Forgery :ref:`configuration overview <config_http_filters_csrf>`.
  [#extension: envoy.filters.http.csrf]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :filter_enabled, 1,
    type: Envoy.Api.V2.Core.RuntimeFractionalPercent,
    json_name: "filterEnabled",
    deprecated: false

  field :shadow_enabled, 2,
    type: Envoy.Api.V2.Core.RuntimeFractionalPercent,
    json_name: "shadowEnabled"

  field :additional_origins, 3,
    repeated: true,
    type: Envoy.Type.Matcher.StringMatcher,
    json_name: "additionalOrigins"
end

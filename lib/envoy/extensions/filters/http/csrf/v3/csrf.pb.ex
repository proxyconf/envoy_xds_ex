defmodule Envoy.Extensions.Filters.Http.Csrf.V3.CsrfPolicy do
  @moduledoc """
  CSRF filter config.
  [#protodoc-title: CSRF]
  Cross-Site Request Forgery :ref:`configuration overview <config_http_filters_csrf>`.
  [#extension: envoy.filters.http.csrf]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.csrf.v3.CsrfPolicy",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :filter_enabled, 1,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "filterEnabled",
    deprecated: false

  field :shadow_enabled, 2,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "shadowEnabled"

  field :additional_origins, 3,
    repeated: true,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "additionalOrigins"
end

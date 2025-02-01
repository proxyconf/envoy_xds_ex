defmodule Envoy.Config.Filter.Http.Router.V2.Router do
  @moduledoc """
  [#next-free-field: 7]
  [#protodoc-title: Router]
  Router :ref:`configuration overview <config_http_filters_router>`.
  [#extension: envoy.filters.http.router]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :dynamic_stats, 1, type: Google.Protobuf.BoolValue, json_name: "dynamicStats"
  field :start_child_span, 2, type: :bool, json_name: "startChildSpan"

  field :upstream_log, 3,
    repeated: true,
    type: Envoy.Config.Filter.Accesslog.V2.AccessLog,
    json_name: "upstreamLog"

  field :suppress_envoy_headers, 4, type: :bool, json_name: "suppressEnvoyHeaders"

  field :strict_check_headers, 5,
    repeated: true,
    type: :string,
    json_name: "strictCheckHeaders",
    deprecated: false

  field :respect_expected_rq_timeout, 6, type: :bool, json_name: "respectExpectedRqTimeout"
end

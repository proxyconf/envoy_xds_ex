defmodule Envoy.Config.Filter.Http.Cors.V2.Cors do
  @moduledoc """
  Cors filter config.
  [#protodoc-title: Cors]
  CORS Filter :ref:`configuration overview <config_http_filters_cors>`.
  [#extension: envoy.filters.http.cors]
  """

  use Protobuf,
    full_name: "envoy.config.filter.http.cors.v2.Cors",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

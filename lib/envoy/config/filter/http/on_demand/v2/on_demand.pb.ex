defmodule Envoy.Config.Filter.Http.OnDemand.V2.OnDemand do
  @moduledoc """
  [#protodoc-title: OnDemand]
  IP tagging :ref:`configuration overview <config_http_filters_on_demand>`.
  [#extension: envoy.filters.http.on_demand]
  """

  use Protobuf,
    full_name: "envoy.config.filter.http.on_demand.v2.OnDemand",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

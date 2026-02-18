defmodule Envoy.Config.Filter.Http.Tap.V2alpha.Tap do
  @moduledoc """
  Top level configuration for the tap filter.
  [#protodoc-title: Tap]
  Tap :ref:`configuration overview <config_http_filters_tap>`.
  [#extension: envoy.filters.http.tap]
  """

  use Protobuf,
    full_name: "envoy.config.filter.http.tap.v2alpha.Tap",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :common_config, 1,
    type: Envoy.Config.Common.Tap.V2alpha.CommonExtensionConfig,
    json_name: "commonConfig",
    deprecated: false
end

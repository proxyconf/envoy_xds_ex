defmodule Envoy.Config.Filter.Http.Tap.V2alpha.Tap do
  @moduledoc """
  Top level configuration for the tap filter.
  [#protodoc-title: Tap]
  Tap :ref:`configuration overview <config_http_filters_tap>`.
  [#extension: envoy.filters.http.tap]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :common_config, 1,
    type: Envoy.Config.Common.Tap.V2alpha.CommonExtensionConfig,
    json_name: "commonConfig",
    deprecated: false
end

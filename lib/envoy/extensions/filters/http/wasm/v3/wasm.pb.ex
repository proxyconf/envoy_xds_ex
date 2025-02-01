defmodule Envoy.Extensions.Filters.Http.Wasm.V3.Wasm do
  @moduledoc """
  [#protodoc-title: Wasm]
  [#extension: envoy.filters.http.wasm]
  Wasm :ref:`configuration overview <config_http_filters_wasm>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :config, 1, type: Envoy.Extensions.Wasm.V3.PluginConfig
end

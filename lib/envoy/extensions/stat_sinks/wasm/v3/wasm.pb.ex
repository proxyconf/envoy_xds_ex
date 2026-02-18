defmodule Envoy.Extensions.StatSinks.Wasm.V3.Wasm do
  @moduledoc """
  [#protodoc-title: Wasm]
  Wasm :ref:`configuration overview <config_stat_sinks_wasm>`.
  [#extension: envoy.stat_sinks.wasm]
  """

  use Protobuf,
    full_name: "envoy.extensions.stat_sinks.wasm.v3.Wasm",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :config, 1, type: Envoy.Extensions.Wasm.V3.PluginConfig
end

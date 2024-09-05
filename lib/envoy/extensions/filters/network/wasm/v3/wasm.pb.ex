defmodule Envoy.Extensions.Filters.Network.Wasm.V3.Wasm do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :config, 1, type: Envoy.Extensions.Wasm.V3.PluginConfig
end
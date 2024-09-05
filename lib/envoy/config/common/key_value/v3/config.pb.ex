defmodule Envoy.Config.Common.KeyValue.V3.KeyValueStoreConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :config, 1, type: Envoy.Config.Core.V3.TypedExtensionConfig, deprecated: false
end
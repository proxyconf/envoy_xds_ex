defmodule Envoy.Config.Common.KeyValue.V3.KeyValueStoreConfig do
  @moduledoc """
  This shared configuration for Envoy key value stores.
  [#protodoc-title: Key/value store storage plugin]
  """

  use Protobuf,
    full_name: "envoy.config.common.key_value.v3.KeyValueStoreConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :config, 1, type: Envoy.Config.Core.V3.TypedExtensionConfig, deprecated: false
end

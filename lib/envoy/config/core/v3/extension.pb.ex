defmodule Envoy.Config.Core.V3.TypedExtensionConfig do
  @moduledoc """
  Message type for extension configuration.
  [#next-major-version: revisit all existing typed_config that doesn't use this wrapper.].
  [#protodoc-title: Extension configuration]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 2, type: Google.Protobuf.Any, json_name: "typedConfig", deprecated: false
end

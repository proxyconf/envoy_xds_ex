defmodule Xds.Core.V3.TypedExtensionConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 2, type: Google.Protobuf.Any, json_name: "typedConfig", deprecated: false
end
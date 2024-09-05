defmodule Envoy.Config.Filter.Http.Lua.V2.Lua do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :inline_code, 1, type: :string, json_name: "inlineCode", deprecated: false
end
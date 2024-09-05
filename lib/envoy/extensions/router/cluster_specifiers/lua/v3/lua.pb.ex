defmodule Envoy.Extensions.Router.ClusterSpecifiers.Lua.V3.LuaConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :source_code, 1,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "sourceCode",
    deprecated: false

  field :default_cluster, 2, type: :string, json_name: "defaultCluster"
end
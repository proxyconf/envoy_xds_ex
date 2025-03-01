defmodule Envoy.Extensions.Filters.Http.Lua.V3.Lua.SourceCodesEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Config.Core.V3.DataSource
end

defmodule Envoy.Extensions.Filters.Http.Lua.V3.Lua do
  @moduledoc """
  [#protodoc-title: Lua]
  Lua :ref:`configuration overview <config_http_filters_lua>`.
  [#extension: envoy.filters.http.lua]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :inline_code, 1, type: :string, json_name: "inlineCode", deprecated: true

  field :source_codes, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.Lua.V3.Lua.SourceCodesEntry,
    json_name: "sourceCodes",
    map: true

  field :default_source_code, 3,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "defaultSourceCode"

  field :stat_prefix, 4, type: :string, json_name: "statPrefix"
end

defmodule Envoy.Extensions.Filters.Http.Lua.V3.LuaPerRoute do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :override, 0

  field :disabled, 1, type: :bool, oneof: 0, deprecated: false
  field :name, 2, type: :string, oneof: 0, deprecated: false
  field :source_code, 3, type: Envoy.Config.Core.V3.DataSource, json_name: "sourceCode", oneof: 0
end

defmodule Envoy.Config.Filter.Http.Lua.V2.Lua do
  @moduledoc """
  [#protodoc-title: Lua]
  Lua :ref:`configuration overview <config_http_filters_lua>`.
  [#extension: envoy.filters.http.lua]
  """

  use Protobuf,
    full_name: "envoy.config.filter.http.lua.v2.Lua",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :inline_code, 1, type: :string, json_name: "inlineCode", deprecated: false
end

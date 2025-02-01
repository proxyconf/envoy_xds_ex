defmodule Envoy.Extensions.StringMatcher.Lua.V3.Lua do
  @moduledoc """
  [#protodoc-title: Lua StringMatcher]
  A Lua StringMatcher allows executing a Lua script to determine if a string is a match. The configured source
  code must define a function named `envoy_match`. If the function returns true, the string is considered a match.
  Any other result, including an execution error, is considered a non-match.

  Example:

  .. code-block:: yaml

  source_code:
  inline_string: |
  function envoy_match(str)
  -- Do something.
  return true
  end

  [#extension: envoy.string_matcher.lua]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :source_code, 1,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "sourceCode",
    deprecated: false
end

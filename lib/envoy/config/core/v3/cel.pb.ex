defmodule Envoy.Config.Core.V3.CelExpressionConfig do
  @moduledoc """
  CEL expression evaluation configuration.
  These options control the behavior of the Common Expression Language runtime for
  individual CEL expressions.
  [#protodoc-title: CEL Expression Configuration]
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.CelExpressionConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :enable_string_conversion, 1, type: :bool, json_name: "enableStringConversion"
  field :enable_string_concat, 2, type: :bool, json_name: "enableStringConcat"
  field :enable_string_functions, 3, type: :bool, json_name: "enableStringFunctions"
end

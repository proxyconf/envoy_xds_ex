defmodule Envoy.Extensions.AccessLoggers.Filters.Cel.V3.ExpressionFilter do
  @moduledoc """
  ExpressionFilter is an access logging filter that evaluates configured
  symbolic Common Expression Language expressions to inform the decision
  to generate an access log.
  [#protodoc-title: ExpressionFilter]
  [#extension: envoy.access_loggers.extension_filters.cel]
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.filters.cel.v3.ExpressionFilter",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :expression, 1, type: :string
  field :cel_config, 2, type: Envoy.Config.Core.V3.CelExpressionConfig, json_name: "celConfig"
end

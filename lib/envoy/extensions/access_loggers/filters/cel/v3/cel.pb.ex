defmodule Envoy.Extensions.AccessLoggers.Filters.Cel.V3.ExpressionFilter do
  @moduledoc """
  ExpressionFilter is an access logging filter that evaluates configured
  symbolic Common Expression Language expressions to inform the decision
  to generate an access log.
  [#protodoc-title: ExpressionFilter]
  [#extension: envoy.access_loggers.extension_filters.cel]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :expression, 1, type: :string
end

defmodule Envoy.Extensions.Formatter.Cel.V3.Cel do
  @moduledoc """
  Configuration for the CEL formatter.
  [#protodoc-title: Formatter extension for printing CEL expressions]
  [#extension: envoy.formatter.cel]
  CEL formatter extension implements CEL command operator that evaluates configured
  symbolic Common Expression Language expressions to generate an access log.

  See :ref:`here <config_access_log>` for more information on access log configuration.
  %CEL(EXPRESSION):Z%
  Expressions are based on the set of Envoy :ref:`attributes <arch_overview_attributes>`.
  Expression errors are considered `-`. Z is an optional parameter denoting string
  truncation up to Z characters long.

  Examples:

  * ``%CEL(response.code)%``
  * ``%CEL(connection.mtls)%``
  * ``%CEL(request.headers['x-envoy-original-path']):10%``
  * ``%CEL(request.headers['x-log-mtls'] || request.url_path.contains('v1beta3'))%``
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

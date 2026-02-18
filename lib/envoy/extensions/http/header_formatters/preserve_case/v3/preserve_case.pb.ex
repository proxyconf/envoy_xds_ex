defmodule Envoy.Extensions.Http.HeaderFormatters.PreserveCase.V3.PreserveCaseFormatterConfig.FormatterTypeOnEnvoyHeaders do
  use Protobuf,
    enum: true,
    full_name:
      "envoy.extensions.http.header_formatters.preserve_case.v3.PreserveCaseFormatterConfig.FormatterTypeOnEnvoyHeaders",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :DEFAULT, 0
  field :PROPER_CASE, 1
end

defmodule Envoy.Extensions.Http.HeaderFormatters.PreserveCase.V3.PreserveCaseFormatterConfig do
  @moduledoc """
  Configuration for the preserve case header formatter.
  See the :ref:`header casing <config_http_conn_man_header_casing>` configuration guide for more
  information.
  [#protodoc-title: Preserve case header formatter]
  [#extension: envoy.http.stateful_header_formatters.preserve_case]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.http.header_formatters.preserve_case.v3.PreserveCaseFormatterConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :forward_reason_phrase, 1, type: :bool, json_name: "forwardReasonPhrase"

  field :formatter_type_on_envoy_headers, 2,
    type:
      Envoy.Extensions.Http.HeaderFormatters.PreserveCase.V3.PreserveCaseFormatterConfig.FormatterTypeOnEnvoyHeaders,
    json_name: "formatterTypeOnEnvoyHeaders",
    enum: true,
    deprecated: false
end

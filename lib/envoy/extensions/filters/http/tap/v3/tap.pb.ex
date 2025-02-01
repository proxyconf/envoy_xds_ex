defmodule Envoy.Extensions.Filters.Http.Tap.V3.Tap do
  @moduledoc """
  Top level configuration for the tap filter.
  [#protodoc-title: Tap]
  Tap :ref:`configuration overview <config_http_filters_tap>`.
  [#extension: envoy.filters.http.tap]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :common_config, 1,
    type: Envoy.Extensions.Common.Tap.V3.CommonExtensionConfig,
    json_name: "commonConfig",
    deprecated: false

  field :record_headers_received_time, 2, type: :bool, json_name: "recordHeadersReceivedTime"
  field :record_downstream_connection, 3, type: :bool, json_name: "recordDownstreamConnection"
end

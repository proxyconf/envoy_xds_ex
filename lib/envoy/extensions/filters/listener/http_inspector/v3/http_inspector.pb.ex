defmodule Envoy.Extensions.Filters.Listener.HttpInspector.V3.HttpInspector do
  @moduledoc """
  [#protodoc-title: HTTP Inspector Filter]
  Detect whether the application protocol is HTTP.
  [#extension: envoy.filters.listener.http_inspector]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.listener.http_inspector.v3.HttpInspector",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

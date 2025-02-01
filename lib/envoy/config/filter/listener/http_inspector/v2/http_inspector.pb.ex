defmodule Envoy.Config.Filter.Listener.HttpInspector.V2.HttpInspector do
  @moduledoc """
  [#protodoc-title: HTTP Inspector Filter]
  Detect whether the application protocol is HTTP.
  [#extension: envoy.filters.listener.http_inspector]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

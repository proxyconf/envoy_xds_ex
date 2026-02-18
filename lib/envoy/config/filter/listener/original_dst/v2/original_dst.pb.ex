defmodule Envoy.Config.Filter.Listener.OriginalDst.V2.OriginalDst do
  @moduledoc """
  [#protodoc-title: Original Dst Filter]
  Use the Original destination address on downstream connections.
  [#extension: envoy.filters.listener.original_dst]
  """

  use Protobuf,
    full_name: "envoy.config.filter.listener.original_dst.v2.OriginalDst",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

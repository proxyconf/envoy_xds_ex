defmodule Envoy.Extensions.Filters.Listener.OriginalDst.V3.OriginalDst do
  @moduledoc """
  [#protodoc-title: Original Dst Filter]
  Use the Original destination address on downstream connections.
  [#extension: envoy.filters.listener.original_dst]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.listener.original_dst.v3.OriginalDst",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

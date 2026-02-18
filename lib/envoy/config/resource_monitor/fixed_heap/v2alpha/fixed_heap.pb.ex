defmodule Envoy.Config.ResourceMonitor.FixedHeap.V2alpha.FixedHeapConfig do
  @moduledoc """
  The fixed heap resource monitor reports the Envoy process memory pressure, computed as a
  fraction of currently reserved heap memory divided by a statically configured maximum
  specified in the FixedHeapConfig.
  [#protodoc-title: Fixed heap]
  [#extension: envoy.resource_monitors.fixed_heap]
  """

  use Protobuf,
    full_name: "envoy.config.resource_monitor.fixed_heap.v2alpha.FixedHeapConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :max_heap_size_bytes, 1, type: :uint64, json_name: "maxHeapSizeBytes", deprecated: false
end

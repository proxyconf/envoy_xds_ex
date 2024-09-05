defmodule Envoy.Config.ResourceMonitor.FixedHeap.V2alpha.FixedHeapConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :max_heap_size_bytes, 1, type: :uint64, json_name: "maxHeapSizeBytes", deprecated: false
end
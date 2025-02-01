defmodule Envoy.Admin.V2alpha.Memory do
  @moduledoc """
  Proto representation of the internal memory consumption of an Envoy instance. These represent
  values extracted from an internal TCMalloc instance. For more information, see the section of the
  docs entitled ["Generic Tcmalloc Status"](https://gperftools.github.io/gperftools/tcmalloc.html).
  [#next-free-field: 7]
  [#protodoc-title: Memory]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :allocated, 1, type: :uint64
  field :heap_size, 2, type: :uint64, json_name: "heapSize"
  field :pageheap_unmapped, 3, type: :uint64, json_name: "pageheapUnmapped"
  field :pageheap_free, 4, type: :uint64, json_name: "pageheapFree"
  field :total_thread_cache, 5, type: :uint64, json_name: "totalThreadCache"
  field :total_physical_bytes, 6, type: :uint64, json_name: "totalPhysicalBytes"
end

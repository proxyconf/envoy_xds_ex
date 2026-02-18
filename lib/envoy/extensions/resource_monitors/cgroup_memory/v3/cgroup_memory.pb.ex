defmodule Envoy.Extensions.ResourceMonitors.CgroupMemory.V3.CgroupMemoryConfig do
  @moduledoc """
  [#protodoc-title: Cgroup Memory]
  [#extension: envoy.resource_monitors.cgroup_memory]
  """

  use Protobuf,
    full_name: "envoy.extensions.resource_monitors.cgroup_memory.v3.CgroupMemoryConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :max_memory_bytes, 1, type: :uint64, json_name: "maxMemoryBytes"
end

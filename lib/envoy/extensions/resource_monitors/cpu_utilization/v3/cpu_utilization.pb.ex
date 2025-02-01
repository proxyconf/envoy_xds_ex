defmodule Envoy.Extensions.ResourceMonitors.CpuUtilization.V3.CpuUtilizationConfig.UtilizationComputeStrategy do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :HOST, 0
  field :CONTAINER, 1
end

defmodule Envoy.Extensions.ResourceMonitors.CpuUtilization.V3.CpuUtilizationConfig do
  @moduledoc """
  The CPU utilization resource monitor reports the Envoy process the CPU Utilization across different platforms.
  [#protodoc-title: CPU utilization]
  [#extension: envoy.resource_monitors.cpu_utilization]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :mode, 1,
    type:
      Envoy.Extensions.ResourceMonitors.CpuUtilization.V3.CpuUtilizationConfig.UtilizationComputeStrategy,
    enum: true,
    deprecated: false
end

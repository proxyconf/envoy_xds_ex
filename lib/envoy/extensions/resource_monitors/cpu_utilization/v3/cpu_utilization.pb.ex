defmodule Envoy.Extensions.ResourceMonitors.CpuUtilization.V3.CpuUtilizationConfig.UtilizationComputeStrategy do
  use Protobuf,
    enum: true,
    full_name:
      "envoy.extensions.resource_monitors.cpu_utilization.v3.CpuUtilizationConfig.UtilizationComputeStrategy",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :HOST, 0
  field :CONTAINER, 1
end

defmodule Envoy.Extensions.ResourceMonitors.CpuUtilization.V3.CpuUtilizationConfig do
  @moduledoc """
  The CPU utilization resource monitor reports the Envoy process the CPU Utilization across different platforms.
  [#protodoc-title: CPU utilization]
  [#extension: envoy.resource_monitors.cpu_utilization]
  """

  use Protobuf,
    full_name: "envoy.extensions.resource_monitors.cpu_utilization.v3.CpuUtilizationConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :mode, 1,
    type:
      Envoy.Extensions.ResourceMonitors.CpuUtilization.V3.CpuUtilizationConfig.UtilizationComputeStrategy,
    enum: true,
    deprecated: false
end

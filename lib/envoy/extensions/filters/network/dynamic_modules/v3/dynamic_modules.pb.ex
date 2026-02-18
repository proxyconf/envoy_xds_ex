defmodule Envoy.Extensions.Filters.Network.DynamicModules.V3.DynamicModuleNetworkFilter do
  @moduledoc """
  Configuration for the Dynamic Modules network filter. This filter allows loading shared object
  files that can be loaded via ``dlopen`` to extend the network filter chain.

  A module can be loaded by multiple network filters; the module is loaded only once and shared
  across multiple filters.

  Unlike HTTP filters which operate on structured headers, body, and trailers, network filters work
  with raw TCP byte streams. The filter can:

  * Inspect, modify, or inject data into the downstream connection.
  * Access connection-level information such as addresses and TLS status.
  * Control connection lifecycle (e.g., close the connection).
  [#protodoc-title: Dynamic Modules Network Filter]
  [#extension: envoy.filters.network.dynamic_modules]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.dynamic_modules.v3.DynamicModuleNetworkFilter",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig"

  field :filter_name, 2, type: :string, json_name: "filterName"
  field :filter_config, 3, type: Google.Protobuf.Any, json_name: "filterConfig"
  field :terminal_filter, 4, type: :bool, json_name: "terminalFilter"
end

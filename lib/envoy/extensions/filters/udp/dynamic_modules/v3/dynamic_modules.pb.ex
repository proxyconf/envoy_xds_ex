defmodule Envoy.Extensions.Filters.Udp.DynamicModules.V3.DynamicModuleUdpListenerFilter do
  @moduledoc """
  Configuration for the Dynamic Modules UDP listener filter. This filter allows loading shared object
  files that can be loaded via ``dlopen`` to extend the UDP listener filter chain.

  A module can be loaded by multiple UDP listener filters; the module is loaded only once and shared
  across multiple filters.
  [#protodoc-title: Dynamic Modules UDP Listener Filter]
  [#extension: envoy.filters.udp_listener.dynamic_modules]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.udp.dynamic_modules.v3.DynamicModuleUdpListenerFilter",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig"

  field :filter_name, 2, type: :string, json_name: "filterName"
  field :filter_config, 3, type: Google.Protobuf.Any, json_name: "filterConfig"
end

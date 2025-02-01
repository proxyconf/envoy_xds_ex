defmodule Envoy.Extensions.Filters.Http.DynamicModules.V3.DynamicModuleFilter do
  @moduledoc """
  Configuration of the HTTP filter for dynamic modules. This filter allows loading shared object files
  that can be loaded via dlopen by the HTTP filter.

  A module can be loaded by multiple HTTP filters, hence the program can be structured in a way that
  the module is loaded only once and shared across multiple filters providing multiple functionalities.

  Currently, the implementation is work in progress and not usable.
  [#protodoc-title: HTTP filter for dynamic modules]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig"

  field :filter_name, 2, type: :string, json_name: "filterName"
  field :filter_config, 3, type: :string, json_name: "filterConfig"
end

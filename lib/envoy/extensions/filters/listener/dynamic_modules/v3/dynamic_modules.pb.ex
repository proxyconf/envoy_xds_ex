defmodule Envoy.Extensions.Filters.Listener.DynamicModules.V3.DynamicModuleListenerFilter do
  @moduledoc """
  Configuration of the listener filter for dynamic modules. This filter allows loading shared object
  files that can be loaded via dlopen by the listener filter.

  A module can be loaded by multiple listener filters, hence the program can be structured in a way
  that the module is loaded only once and shared across multiple filters providing multiple
  functionalities.

  Unlike network filters which operate on established TCP connections, listener filters
  work with raw accepted sockets BEFORE a Connection object is created. The filter can:

  * Inspect initial bytes to detect protocols (TLS, HTTP, PostgreSQL, etc.).
  * Set socket properties (SNI, ALPN, transport protocol, fingerprints).
  * Modify connection addresses (original destination restoration).
  * Set dynamic metadata and filter state for downstream filters.
  * Rate limit incoming connections.
  [#protodoc-title: Listener filter for dynamic modules]
  [#extension: envoy.filters.listener.dynamic_modules]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.listener.dynamic_modules.v3.DynamicModuleListenerFilter",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig"

  field :filter_name, 2, type: :string, json_name: "filterName"
  field :filter_config, 3, type: Google.Protobuf.Any, json_name: "filterConfig"
end

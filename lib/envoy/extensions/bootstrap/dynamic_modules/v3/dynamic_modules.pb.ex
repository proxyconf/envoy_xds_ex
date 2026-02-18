defmodule Envoy.Extensions.Bootstrap.DynamicModules.V3.DynamicModuleBootstrapExtension do
  @moduledoc """
  Configuration for the Dynamic Modules bootstrap extension. This extension allows loading shared
  object files that can be loaded via ``dlopen`` to extend Envoy's bootstrap behavior.

  A module can be loaded by multiple bootstrap extensions; the module is loaded only once and shared
  across multiple extensions.

  Bootstrap extensions run on the main thread and are initialized when Envoy starts. They can:

  * Perform initialization tasks when the server is initialized.
  * Perform per-worker thread initialization when worker threads start.
  * Access server-level resources like the cluster manager and dispatcher.
  [#protodoc-title: Dynamic Modules Bootstrap Extension]
  [#extension: envoy.bootstrap.dynamic_modules]
  """

  use Protobuf,
    full_name: "envoy.extensions.bootstrap.dynamic_modules.v3.DynamicModuleBootstrapExtension",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig"

  field :extension_name, 2, type: :string, json_name: "extensionName"
  field :extension_config, 3, type: Google.Protobuf.Any, json_name: "extensionConfig"
end

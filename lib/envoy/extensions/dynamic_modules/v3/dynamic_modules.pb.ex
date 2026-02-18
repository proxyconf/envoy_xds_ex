defmodule Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig do
  @moduledoc """
  Configuration of a dynamic module. A dynamic module is a shared object file that can be loaded via
  ``dlopen`` by various Envoy extension points.

  How a module is loaded is determined by the extension point that uses it. For example, the HTTP
  filter loads the module when Envoy receives a configuration that references the module. If loading
  the module fails, the configuration will be rejected.

  A module is uniquely identified by its file path and the file's inode, depending on the platform.
  Notably, if the file path and the content of the file are the same, the shared object will be
  reused.

  A module must be compatible with the ABI specified in :repo:`abi.h
  <source/extensions/dynamic_modules/abi.h>`. Currently, compatibility is only guaranteed by an
  exact version match between the Envoy codebase and the dynamic module SDKs. In the future, after
  the ABI is stabilized, this restriction will be revisited. Until then, Envoy checks the hash of
  the ABI header files to ensure that the dynamic modules are built against the same version of the
  ABI.
  [#protodoc-title: Dynamic Modules Common Configuration]
  """

  use Protobuf,
    full_name: "envoy.extensions.dynamic_modules.v3.DynamicModuleConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :do_not_close, 3, type: :bool, json_name: "doNotClose"
  field :load_globally, 4, type: :bool, json_name: "loadGlobally"
end

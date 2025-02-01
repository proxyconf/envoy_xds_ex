defmodule Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig do
  @moduledoc """
  Configuration of a dynamic module. A dynamic module is a shared object file that can be loaded via dlopen
  by various Envoy extension points. Currently, only HTTP filter (envoy.filters.http.dynamic_modules) is supported.

  How a module is loaded is determined by the extension point that uses it. For example, the HTTP filter
  loads the module with dlopen when Envoy receives a configuration that references the module at load time.
  If loading the module fails, the configuration will be rejected.

  Whether or not the shared object is the same is determined by the file path as well as the file's inode depending
  on the platform. Notably, if the file path and the content of the file are the same, the shared object will be reused.

  A module must be compatible with the ABI specified in :repo:`abi.h <source/extensions/dynamic_modules/abi.h>`.
  Currently, compatibility is only guaranteed by an exact version match between the Envoy
  codebase and the dynamic module SDKs. In the future, after the ABI is stabilized, we will revisit
  this restriction and hopefully provide a wider compatibility guarantee. Until then, Envoy
  checks the hash of the ABI header files to ensure that the dynamic modules are built against the
  same version of the ABI.

  Currently, the implementation is work in progress and not usable.
  [#protodoc-title: Dynamic Modules common configuration]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :do_not_close, 3, type: :bool, json_name: "doNotClose"
end

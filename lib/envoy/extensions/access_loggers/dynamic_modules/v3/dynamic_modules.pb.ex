defmodule Envoy.Extensions.AccessLoggers.DynamicModules.V3.DynamicModuleAccessLog do
  @moduledoc """
  Configuration for the Dynamic Modules Access Logger. This logger allows loading shared object
  files via ``dlopen`` to implement custom access logging behavior.

  A module can be loaded by multiple access loggers; the module is loaded only once and shared
  across multiple logger instances.

  The access logger receives completed request information including request/response headers,
  stream info (timing, upstream info, response codes), and the log context type.
  [#protodoc-title: Dynamic Modules Access Logger]
  [#extension: envoy.access_loggers.dynamic_modules]
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.dynamic_modules.v3.DynamicModuleAccessLog",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig",
    deprecated: false

  field :logger_name, 2, type: :string, json_name: "loggerName"
  field :logger_config, 3, type: Google.Protobuf.Any, json_name: "loggerConfig"
end

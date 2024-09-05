defmodule Envoy.Extensions.Wasm.V3.CapabilityRestrictionConfig.AllowedCapabilitiesEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Wasm.V3.SanitizationConfig
end

defmodule Envoy.Extensions.Wasm.V3.CapabilityRestrictionConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :allowed_capabilities, 1,
    repeated: true,
    type: Envoy.Extensions.Wasm.V3.CapabilityRestrictionConfig.AllowedCapabilitiesEntry,
    json_name: "allowedCapabilities",
    map: true
end

defmodule Envoy.Extensions.Wasm.V3.SanitizationConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3
end

defmodule Envoy.Extensions.Wasm.V3.VmConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :vm_id, 1, type: :string, json_name: "vmId"
  field :runtime, 2, type: :string
  field :code, 3, type: Envoy.Config.Core.V3.AsyncDataSource
  field :configuration, 4, type: Google.Protobuf.Any
  field :allow_precompiled, 5, type: :bool, json_name: "allowPrecompiled"
  field :nack_on_code_cache_miss, 6, type: :bool, json_name: "nackOnCodeCacheMiss"

  field :environment_variables, 7,
    type: Envoy.Extensions.Wasm.V3.EnvironmentVariables,
    json_name: "environmentVariables"
end

defmodule Envoy.Extensions.Wasm.V3.EnvironmentVariables.KeyValuesEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Extensions.Wasm.V3.EnvironmentVariables do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :host_env_keys, 1, repeated: true, type: :string, json_name: "hostEnvKeys"

  field :key_values, 2,
    repeated: true,
    type: Envoy.Extensions.Wasm.V3.EnvironmentVariables.KeyValuesEntry,
    json_name: "keyValues",
    map: true
end

defmodule Envoy.Extensions.Wasm.V3.PluginConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :vm, 0

  field :name, 1, type: :string
  field :root_id, 2, type: :string, json_name: "rootId"
  field :vm_config, 3, type: Envoy.Extensions.Wasm.V3.VmConfig, json_name: "vmConfig", oneof: 0
  field :configuration, 4, type: Google.Protobuf.Any
  field :fail_open, 5, type: :bool, json_name: "failOpen"

  field :capability_restriction_config, 6,
    type: Envoy.Extensions.Wasm.V3.CapabilityRestrictionConfig,
    json_name: "capabilityRestrictionConfig"
end

defmodule Envoy.Extensions.Wasm.V3.WasmService do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :config, 1, type: Envoy.Extensions.Wasm.V3.PluginConfig
  field :singleton, 2, type: :bool
end
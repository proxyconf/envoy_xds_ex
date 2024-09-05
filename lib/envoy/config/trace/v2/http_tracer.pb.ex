defmodule Envoy.Config.Trace.V2.Tracing.Http do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Trace.V2.Tracing do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :http, 1, type: Envoy.Config.Trace.V2.Tracing.Http
end
defmodule Envoy.Config.Filter.Http.Tap.V2alpha.Tap do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :common_config, 1,
    type: Envoy.Config.Common.Tap.V2alpha.CommonExtensionConfig,
    json_name: "commonConfig",
    deprecated: false
end
defmodule Envoy.Admin.V2alpha.TapRequest do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :config_id, 1, type: :string, json_name: "configId", deprecated: false

  field :tap_config, 2,
    type: Envoy.Service.Tap.V2alpha.TapConfig,
    json_name: "tapConfig",
    deprecated: false
end
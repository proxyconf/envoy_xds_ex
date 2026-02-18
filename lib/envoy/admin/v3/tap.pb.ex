defmodule Envoy.Admin.V3.TapRequest do
  @moduledoc """
  The /tap admin request body that is used to configure an active tap session.
  [#protodoc-title: Tap]
  """

  use Protobuf,
    full_name: "envoy.admin.v3.TapRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :config_id, 1, type: :string, json_name: "configId", deprecated: false

  field :tap_config, 2,
    type: Envoy.Config.Tap.V3.TapConfig,
    json_name: "tapConfig",
    deprecated: false
end

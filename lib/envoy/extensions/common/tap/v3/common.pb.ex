defmodule Envoy.Extensions.Common.Tap.V3.CommonExtensionConfig do
  @moduledoc """
  Common configuration for all tap extensions.
  [#protodoc-title: Common tap extension configuration]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_type, 0

  field :admin_config, 1,
    type: Envoy.Extensions.Common.Tap.V3.AdminConfig,
    json_name: "adminConfig",
    oneof: 0

  field :static_config, 2,
    type: Envoy.Config.Tap.V3.TapConfig,
    json_name: "staticConfig",
    oneof: 0
end

defmodule Envoy.Extensions.Common.Tap.V3.AdminConfig do
  @moduledoc """
  Configuration for the admin handler. See :ref:`here <config_http_filters_tap_admin_handler>` for
  more information.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :config_id, 1, type: :string, json_name: "configId", deprecated: false
end

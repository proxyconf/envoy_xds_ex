defmodule Envoy.Extensions.AccessLoggers.Wasm.V3.WasmAccessLog do
  @moduledoc """
  Custom configuration for an :ref:`AccessLog <envoy_v3_api_msg_config.accesslog.v3.AccessLog>`
  that calls into a WASM VM. Configures the built-in ``envoy.access_loggers.wasm``
  AccessLog.
  [#protodoc-title: Wasm access log]
  [#extension: envoy.access_loggers.wasm]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :config, 1, type: Envoy.Extensions.Wasm.V3.PluginConfig
end

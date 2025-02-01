defmodule Envoy.Extensions.TransportSockets.Tap.V3.Tap do
  @moduledoc """
  Configuration for tap transport socket. This wraps another transport socket, providing the
  ability to interpose and record in plain text any traffic that is surfaced to Envoy.
  [#protodoc-title: Tap]
  [#extension: envoy.transport_sockets.tap]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :common_config, 1,
    type: Envoy.Extensions.Common.Tap.V3.CommonExtensionConfig,
    json_name: "commonConfig",
    deprecated: false

  field :transport_socket, 2,
    type: Envoy.Config.Core.V3.TransportSocket,
    json_name: "transportSocket",
    deprecated: false
end

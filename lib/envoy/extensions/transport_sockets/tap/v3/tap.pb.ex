defmodule Envoy.Extensions.TransportSockets.Tap.V3.Tap do
  @moduledoc """
  Configuration for tap transport socket. This wraps another transport socket, providing the
  ability to interpose and record in plain text any traffic that is surfaced to Envoy.
  [#protodoc-title: Tap]
  [#extension: envoy.transport_sockets.tap]
  """

  use Protobuf,
    full_name: "envoy.extensions.transport_sockets.tap.v3.Tap",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :common_config, 1,
    type: Envoy.Extensions.Common.Tap.V3.CommonExtensionConfig,
    json_name: "commonConfig",
    deprecated: false

  field :transport_socket, 2,
    type: Envoy.Config.Core.V3.TransportSocket,
    json_name: "transportSocket",
    deprecated: false

  field :socket_tap_config, 3,
    type: Envoy.Extensions.TransportSockets.Tap.V3.SocketTapConfig,
    json_name: "socketTapConfig"
end

defmodule Envoy.Extensions.TransportSockets.Tap.V3.SocketTapConfig do
  @moduledoc """
  Additional configurations for the transport socket tap
  """

  use Protobuf,
    full_name: "envoy.extensions.transport_sockets.tap.v3.SocketTapConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :set_connection_per_event, 1, type: :bool, json_name: "setConnectionPerEvent"
  field :stats_prefix, 2, type: :string, json_name: "statsPrefix"
end

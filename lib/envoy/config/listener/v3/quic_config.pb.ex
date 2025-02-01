defmodule Envoy.Config.Listener.V3.QuicProtocolOptions do
  @moduledoc """
  Configuration specific to the UDP QUIC listener.
  [#next-free-field: 14]
  [#protodoc-title: QUIC listener config]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :quic_protocol_options, 1,
    type: Envoy.Config.Core.V3.QuicProtocolOptions,
    json_name: "quicProtocolOptions"

  field :idle_timeout, 2, type: Google.Protobuf.Duration, json_name: "idleTimeout"

  field :crypto_handshake_timeout, 3,
    type: Google.Protobuf.Duration,
    json_name: "cryptoHandshakeTimeout"

  field :enabled, 4, type: Envoy.Config.Core.V3.RuntimeFeatureFlag

  field :packets_to_read_to_connection_count_ratio, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "packetsToReadToConnectionCountRatio",
    deprecated: false

  field :crypto_stream_config, 6,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "cryptoStreamConfig"

  field :proof_source_config, 7,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "proofSourceConfig"

  field :connection_id_generator_config, 8,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "connectionIdGeneratorConfig"

  field :server_preferred_address_config, 9,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "serverPreferredAddressConfig",
    deprecated: false

  field :send_disable_active_migration, 10,
    type: Google.Protobuf.BoolValue,
    json_name: "sendDisableActiveMigration"

  field :connection_debug_visitor_config, 11,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "connectionDebugVisitorConfig"

  field :save_cmsg_config, 12,
    repeated: true,
    type: Envoy.Config.Core.V3.SocketCmsgHeaders,
    json_name: "saveCmsgConfig",
    deprecated: false

  field :reject_new_connections, 13, type: :bool, json_name: "rejectNewConnections"
end

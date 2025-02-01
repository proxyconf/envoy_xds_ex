defmodule Envoy.Extensions.TransportSockets.Alts.V3.Alts do
  @moduledoc """
  Configuration for ALTS transport socket. This provides Google's ALTS protocol to Envoy.
  Store the peer identity in dynamic metadata, namespace is "envoy.transport_socket.peer_information", key is "peer_identity".
  https://cloud.google.com/security/encryption-in-transit/application-layer-transport-security/
  [#protodoc-title: ALTS]
  [#extension: envoy.transport_sockets.alts]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :handshaker_service, 1, type: :string, json_name: "handshakerService", deprecated: false
  field :peer_service_accounts, 2, repeated: true, type: :string, json_name: "peerServiceAccounts"
end

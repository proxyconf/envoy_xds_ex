defmodule Envoy.Config.TransportSocket.Alts.V2alpha.Alts do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :handshaker_service, 1, type: :string, json_name: "handshakerService", deprecated: false
  field :peer_service_accounts, 2, repeated: true, type: :string, json_name: "peerServiceAccounts"
end
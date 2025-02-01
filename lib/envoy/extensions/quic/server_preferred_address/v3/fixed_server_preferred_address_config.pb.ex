defmodule Envoy.Extensions.Quic.ServerPreferredAddress.V3.FixedServerPreferredAddressConfig.AddressFamilyConfig do
  @moduledoc """
  Addresses for server preferred address for a single address family (IPv4 or IPv6).
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :address, 1, type: Envoy.Config.Core.V3.SocketAddress
  field :dnat_address, 2, type: Envoy.Config.Core.V3.SocketAddress, json_name: "dnatAddress"
end

defmodule Envoy.Extensions.Quic.ServerPreferredAddress.V3.FixedServerPreferredAddressConfig do
  @moduledoc """
  Configuration for FixedServerPreferredAddressConfig.
  [#protodoc-title: QUIC fixed server preferred address config]
  [#extension: envoy.quic.server_preferred_address.fixed]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ipv4_address, 1, type: :string, json_name: "ipv4Address"

  field :ipv4_config, 3,
    type:
      Envoy.Extensions.Quic.ServerPreferredAddress.V3.FixedServerPreferredAddressConfig.AddressFamilyConfig,
    json_name: "ipv4Config"

  field :ipv6_address, 2, type: :string, json_name: "ipv6Address"

  field :ipv6_config, 4,
    type:
      Envoy.Extensions.Quic.ServerPreferredAddress.V3.FixedServerPreferredAddressConfig.AddressFamilyConfig,
    json_name: "ipv6Config"
end

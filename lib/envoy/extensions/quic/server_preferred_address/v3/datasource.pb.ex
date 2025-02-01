defmodule Envoy.Extensions.Quic.ServerPreferredAddress.V3.DataSourceServerPreferredAddressConfig.AddressFamilyConfig do
  @moduledoc """
  Addresses for server preferred address for a single address family (IPv4 or IPv6).
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :address, 1, type: Envoy.Config.Core.V3.DataSource, deprecated: false
  field :port, 2, type: Envoy.Config.Core.V3.DataSource
  field :dnat_address, 3, type: Envoy.Config.Core.V3.DataSource, json_name: "dnatAddress"
end

defmodule Envoy.Extensions.Quic.ServerPreferredAddress.V3.DataSourceServerPreferredAddressConfig do
  @moduledoc """
  Configuration for DataSourceServerPreferredAddressConfig.
  [#protodoc-title: QUIC DataSource server preferred address config]
  [#extension: envoy.quic.server_preferred_address.datasource]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ipv4_config, 1,
    type:
      Envoy.Extensions.Quic.ServerPreferredAddress.V3.DataSourceServerPreferredAddressConfig.AddressFamilyConfig,
    json_name: "ipv4Config"

  field :ipv6_config, 2,
    type:
      Envoy.Extensions.Quic.ServerPreferredAddress.V3.DataSourceServerPreferredAddressConfig.AddressFamilyConfig,
    json_name: "ipv6Config"
end

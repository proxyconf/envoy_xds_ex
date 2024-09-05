defmodule Envoy.Config.Core.V3.UdpSocketConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :max_rx_datagram_size, 1,
    type: Google.Protobuf.UInt64Value,
    json_name: "maxRxDatagramSize",
    deprecated: false

  field :prefer_gro, 2, type: Google.Protobuf.BoolValue, json_name: "preferGro"
end
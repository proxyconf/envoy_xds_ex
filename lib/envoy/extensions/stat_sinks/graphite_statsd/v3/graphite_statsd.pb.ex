defmodule Envoy.Extensions.StatSinks.GraphiteStatsd.V3.GraphiteStatsdSink do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :statsd_specifier, 0

  field :address, 1, type: Envoy.Config.Core.V3.Address, oneof: 0
  field :prefix, 3, type: :string

  field :max_bytes_per_datagram, 4,
    type: Google.Protobuf.UInt64Value,
    json_name: "maxBytesPerDatagram",
    deprecated: false
end
defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.Route do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :cluster, 1, type: :string, deprecated: false
end
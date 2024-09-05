defmodule Envoy.Extensions.Upstreams.Tcp.V3.TcpProtocolOptions do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :idle_timeout, 1, type: Google.Protobuf.Duration, json_name: "idleTimeout"
end
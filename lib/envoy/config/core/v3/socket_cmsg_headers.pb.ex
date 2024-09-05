defmodule Envoy.Config.Core.V3.SocketCmsgHeaders do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :level, 1, type: Google.Protobuf.UInt32Value
  field :type, 2, type: Google.Protobuf.UInt32Value
  field :expected_size, 3, type: :uint32, json_name: "expectedSize"
end
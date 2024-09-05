defmodule Envoy.Extensions.Bootstrap.InternalListener.V3.InternalListener do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :buffer_size_kb, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "bufferSizeKb",
    deprecated: false
end
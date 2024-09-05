defmodule Envoy.Extensions.Compression.Zstd.Decompressor.V3.Zstd do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :dictionaries, 1, repeated: true, type: Envoy.Config.Core.V3.DataSource

  field :chunk_size, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "chunkSize",
    deprecated: false
end
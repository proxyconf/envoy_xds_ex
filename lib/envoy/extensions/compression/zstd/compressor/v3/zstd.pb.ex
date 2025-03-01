defmodule Envoy.Extensions.Compression.Zstd.Compressor.V3.Zstd.Strategy do
  @moduledoc """
  Reference to http://facebook.github.io/zstd/zstd_manual.html
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DEFAULT, 0
  field :FAST, 1
  field :DFAST, 2
  field :GREEDY, 3
  field :LAZY, 4
  field :LAZY2, 5
  field :BTLAZY2, 6
  field :BTOPT, 7
  field :BTULTRA, 8
  field :BTULTRA2, 9
end

defmodule Envoy.Extensions.Compression.Zstd.Compressor.V3.Zstd do
  @moduledoc """
  [#next-free-field: 6]
  [#protodoc-title: Zstd Compressor]
  [#extension: envoy.compression.zstd.compressor]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :compression_level, 1, type: Google.Protobuf.UInt32Value, json_name: "compressionLevel"
  field :enable_checksum, 2, type: :bool, json_name: "enableChecksum"

  field :strategy, 3,
    type: Envoy.Extensions.Compression.Zstd.Compressor.V3.Zstd.Strategy,
    enum: true,
    deprecated: false

  field :dictionary, 4, type: Envoy.Config.Core.V3.DataSource

  field :chunk_size, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "chunkSize",
    deprecated: false
end

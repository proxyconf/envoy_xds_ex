defmodule Envoy.Extensions.Compression.Brotli.Compressor.V3.Brotli.EncoderMode do
  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.compression.brotli.compressor.v3.Brotli.EncoderMode",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :DEFAULT, 0
  field :GENERIC, 1
  field :TEXT, 2
  field :FONT, 3
end

defmodule Envoy.Extensions.Compression.Brotli.Compressor.V3.Brotli do
  @moduledoc """
  [#next-free-field: 7]
  [#protodoc-title: Brotli Compressor]
  [#extension: envoy.compression.brotli.compressor]
  """

  use Protobuf,
    full_name: "envoy.extensions.compression.brotli.compressor.v3.Brotli",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :quality, 1, type: Google.Protobuf.UInt32Value, deprecated: false

  field :encoder_mode, 2,
    type: Envoy.Extensions.Compression.Brotli.Compressor.V3.Brotli.EncoderMode,
    json_name: "encoderMode",
    enum: true,
    deprecated: false

  field :window_bits, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "windowBits",
    deprecated: false

  field :input_block_bits, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "inputBlockBits",
    deprecated: false

  field :chunk_size, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "chunkSize",
    deprecated: false

  field :disable_literal_context_modeling, 6,
    type: :bool,
    json_name: "disableLiteralContextModeling"
end

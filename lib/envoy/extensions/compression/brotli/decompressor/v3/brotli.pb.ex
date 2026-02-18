defmodule Envoy.Extensions.Compression.Brotli.Decompressor.V3.Brotli do
  @moduledoc """
  [#protodoc-title: Brotli Decompressor]
  [#extension: envoy.compression.brotli.decompressor]
  """

  use Protobuf,
    full_name: "envoy.extensions.compression.brotli.decompressor.v3.Brotli",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :disable_ring_buffer_reallocation, 1,
    type: :bool,
    json_name: "disableRingBufferReallocation"

  field :chunk_size, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "chunkSize",
    deprecated: false
end

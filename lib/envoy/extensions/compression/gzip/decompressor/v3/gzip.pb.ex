defmodule Envoy.Extensions.Compression.Gzip.Decompressor.V3.Gzip do
  @moduledoc """
  [#protodoc-title: Gzip Decompressor]
  [#extension: envoy.compression.gzip.decompressor]
  """

  use Protobuf,
    full_name: "envoy.extensions.compression.gzip.decompressor.v3.Gzip",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :window_bits, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "windowBits",
    deprecated: false

  field :chunk_size, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "chunkSize",
    deprecated: false

  field :max_inflate_ratio, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxInflateRatio",
    deprecated: false
end

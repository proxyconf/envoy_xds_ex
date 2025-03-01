defmodule Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionStrategy do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DEFAULT, 0
  field :FILTERED, 1
  field :HUFFMAN, 2
  field :RLE, 3
end

defmodule Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionLevel.Enum do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DEFAULT, 0
  field :BEST, 1
  field :SPEED, 2
end

defmodule Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionLevel do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Config.Filter.Http.Gzip.V2.Gzip do
  @moduledoc """
  [#next-free-field: 11]
  [#protodoc-title: Gzip]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :memory_level, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "memoryLevel",
    deprecated: false

  field :content_length, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "contentLength",
    deprecated: true

  field :compression_level, 3,
    type: Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionLevel.Enum,
    json_name: "compressionLevel",
    enum: true,
    deprecated: false

  field :compression_strategy, 4,
    type: Envoy.Config.Filter.Http.Gzip.V2.Gzip.CompressionStrategy,
    json_name: "compressionStrategy",
    enum: true,
    deprecated: false

  field :content_type, 6,
    repeated: true,
    type: :string,
    json_name: "contentType",
    deprecated: true

  field :disable_on_etag_header, 7,
    type: :bool,
    json_name: "disableOnEtagHeader",
    deprecated: true

  field :remove_accept_encoding_header, 8,
    type: :bool,
    json_name: "removeAcceptEncodingHeader",
    deprecated: true

  field :window_bits, 9,
    type: Google.Protobuf.UInt32Value,
    json_name: "windowBits",
    deprecated: false

  field :compressor, 10, type: Envoy.Config.Filter.Http.Compressor.V2.Compressor
end

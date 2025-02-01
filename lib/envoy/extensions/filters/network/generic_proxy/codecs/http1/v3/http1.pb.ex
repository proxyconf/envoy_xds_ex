defmodule Envoy.Extensions.Filters.Network.GenericProxy.Codecs.Http1.V3.Http1CodecConfig do
  @moduledoc """
  Configuration for HTTP codec. This HTTP1 codec is used to parse and serialize HTTP1 messages
  for the generic proxy filter.
  Any decoding error will result in the generic proxy closing the connection.

  .. note::
  This codec only supports HTTP1.1 messages and does not support HTTP1.0 messages. And it limits
  part of the HTTP1.1 features, such as upgrade, connect, etc.
  This codec is mainly designed for the features evaluation of the generic proxy filter. Please
  be cautious when using it in production.
  [#protodoc-title: HTTP1 codec configuration for Generic Proxy]
  [#extension: envoy.generic_proxy.codecs.http1]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :single_frame_mode, 1, type: Google.Protobuf.BoolValue, json_name: "singleFrameMode"
  field :max_buffer_size, 2, type: Google.Protobuf.UInt32Value, json_name: "maxBufferSize"
end

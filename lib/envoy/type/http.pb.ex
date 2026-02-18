defmodule Envoy.Type.CodecClientType do
  @moduledoc """
  [#protodoc-title: HTTP]
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.type.CodecClientType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :HTTP1, 0
  field :HTTP2, 1
  field :HTTP3, 2
end

defmodule Envoy.Type.V3.CodecClientType do
  @moduledoc """
  [#protodoc-title: HTTP]
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.type.v3.CodecClientType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :HTTP1, 0
  field :HTTP2, 1
  field :HTTP3, 2
end

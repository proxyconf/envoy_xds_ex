defmodule Envoy.Type.CodecClientType do
  @moduledoc """
  [#protodoc-title: HTTP]
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :HTTP1, 0
  field :HTTP2, 1
  field :HTTP3, 2
end

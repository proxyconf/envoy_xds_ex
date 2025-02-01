defmodule Envoy.Extensions.Quic.CryptoStream.V3.CryptoServerStreamConfig do
  @moduledoc """
  Configuration for the default QUIC server crypto stream provided by QUICHE.
  [#protodoc-title: QUIC server crypto stream config]
  [#extension: envoy.quic.crypto_stream.server.quiche]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

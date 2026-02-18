defmodule Envoy.Extensions.Quic.ClientWriterFactory.V3.DefaultClientWriter do
  @moduledoc """
  The default QUIC packet writer used for QUIC upstream connections which is platform independent.
  [#protodoc-title: Default QUIC Client Packet Writer]
  [#extension: envoy.quic.packet_writer.default]
  """

  use Protobuf,
    full_name: "envoy.extensions.quic.client_writer_factory.v3.DefaultClientWriter",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

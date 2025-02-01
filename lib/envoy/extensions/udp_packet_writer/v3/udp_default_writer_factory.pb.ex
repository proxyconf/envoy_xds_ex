defmodule Envoy.Extensions.UdpPacketWriter.V3.UdpDefaultWriterFactory do
  @moduledoc """
  Configuration for the default UDP packet writer factory which simply
  uses the kernel's sendmsg() to send UDP packets.
  [#protodoc-title: UDP packet writer config]
  [#extension: envoy.udp_packet_writer.default]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

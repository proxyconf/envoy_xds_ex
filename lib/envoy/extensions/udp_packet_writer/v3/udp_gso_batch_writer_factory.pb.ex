defmodule Envoy.Extensions.UdpPacketWriter.V3.UdpGsoBatchWriterFactory do
  @moduledoc """
  Configuration for the UDP GSO batch packet writer factory.
  [#protodoc-title: UDP GSO batch packet writer config]
  [#extension: envoy.udp_packet_writer.gso]
  """

  use Protobuf,
    full_name: "envoy.extensions.udp_packet_writer.v3.UdpGsoBatchWriterFactory",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

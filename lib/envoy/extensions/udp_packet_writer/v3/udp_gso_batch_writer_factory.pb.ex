defmodule Envoy.Extensions.UdpPacketWriter.V3.UdpGsoBatchWriterFactory do
  @moduledoc """
  Configuration for the UDP GSO batch packet writer factory.
  [#protodoc-title: UDP GSO batch packet writer config]
  [#extension: envoy.udp_packet_writer.gso]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

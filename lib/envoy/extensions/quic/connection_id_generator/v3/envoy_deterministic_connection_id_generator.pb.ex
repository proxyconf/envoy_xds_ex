defmodule Envoy.Extensions.Quic.ConnectionIdGenerator.V3.DeterministicConnectionIdGeneratorConfig do
  @moduledoc """
  Configuration for a connection ID generator implementation which issues predictable CIDs with stable first 4 bytes.
  [#protodoc-title: QUIC connection ID generator config]
  [#extension: envoy.quic.deterministic_connection_id_generator]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.quic.connection_id_generator.v3.DeterministicConnectionIdGeneratorConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

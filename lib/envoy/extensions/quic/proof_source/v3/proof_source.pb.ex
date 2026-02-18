defmodule Envoy.Extensions.Quic.ProofSource.V3.ProofSourceConfig do
  @moduledoc """
  Configuration for the default QUIC proof source.
  [#protodoc-title: QUIC proof source config]
  [#extension: envoy.quic.proof_source.filter_chain]
  """

  use Protobuf,
    full_name: "envoy.extensions.quic.proof_source.v3.ProofSourceConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

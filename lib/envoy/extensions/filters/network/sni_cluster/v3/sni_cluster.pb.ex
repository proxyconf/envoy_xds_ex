defmodule Envoy.Extensions.Filters.Network.SniCluster.V3.SniCluster do
  @moduledoc """
  [#protodoc-title: SNI Cluster Filter]
  Set the upstream cluster name from the SNI field in the TLS connection.
  [#extension: envoy.filters.network.sni_cluster]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.sni_cluster.v3.SniCluster",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

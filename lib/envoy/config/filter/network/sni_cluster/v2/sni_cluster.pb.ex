defmodule Envoy.Config.Filter.Network.SniCluster.V2.SniCluster do
  @moduledoc """
  [#protodoc-title: SNI Cluster Filter]
  Set the upstream cluster name from the SNI field in the TLS connection.
  [#extension: envoy.filters.network.sni_cluster]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Config.Validators.MinimumClusters.V3.MinimumClustersValidator do
  @moduledoc """
  Validates a CDS config, and ensures that the number of clusters is above the
  set threshold.
  [#protodoc-title: Minimum Clusters]
  [#extension: envoy.config.validators.minimum_clusters_validator]
  """

  use Protobuf,
    full_name: "envoy.extensions.config.validators.minimum_clusters.v3.MinimumClustersValidator",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :min_clusters_num, 1, type: :uint32, json_name: "minClustersNum"
end

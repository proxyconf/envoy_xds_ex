defmodule Envoy.Extensions.Config.Validators.MinimumClusters.V3.MinimumClustersValidator do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :min_clusters_num, 1, type: :uint32, json_name: "minClustersNum"
end
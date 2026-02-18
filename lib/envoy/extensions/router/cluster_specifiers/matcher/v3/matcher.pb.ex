defmodule Envoy.Extensions.Router.ClusterSpecifiers.Matcher.V3.ClusterAction do
  @moduledoc """
  [#protodoc-title: Matcher Based Cluster Specifier]
  [#extension: envoy.router.cluster_specifier_plugin.matcher]
  """

  use Protobuf,
    full_name: "envoy.extensions.router.cluster_specifiers.matcher.v3.ClusterAction",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :cluster, 1, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Router.ClusterSpecifiers.Matcher.V3.MatcherClusterSpecifier do
  use Protobuf,
    full_name: "envoy.extensions.router.cluster_specifiers.matcher.v3.MatcherClusterSpecifier",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :cluster_matcher, 1,
    type: Xds.Type.Matcher.V3.Matcher,
    json_name: "clusterMatcher",
    deprecated: false
end

defmodule Envoy.Extensions.LoadBalancingPolicies.ClusterProvided.V3.ClusterProvided do
  @moduledoc """
  The cluster provided load balancing policy allows cluster to specify its own load balancing.
  If this extension is configured, the target cluster must provide load balancer when the cluster
  is created.

  .. note::
  Cluster provided load balancing policy could not be used as sub-policy of other hierarchical
  load balancing policies, such as subset load balancing policy.
  [#protodoc-title: Cluster Provided Load Balancing Policy]
  [#extension: envoy.load_balancing_policies.cluster_provided]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.LoadBalancingPolicies.RandomSubsetting.V3.RandomSubsetting do
  @moduledoc """
  Configuration for the Random Subsetting Load Balancing Policy

  This policy selects a subset of endpoints and passes them to the child LB policy.
  It maintains 2 important properties:
  1. The policy tries to distribute connections among servers as equally as possible. The higher
  ``(N_clients*subset_size)/N_servers`` ratio is, the closer the resulting server connection
  distribution is to uniform.
  2. The policy minimizes the amount of connection churn generated during server scale-ups by
  using rendezvous hashing

  See the :ref:`load balancing architecture
  overview<arch_overview_load_balancing_types>` for more information.

  [#not-implemented-hide:]
  [#protodoc-title: Random Subsetting Load Balancing Policy]
  [#not-implemented-hide:]
  [#extension: envoy.load_balancing_policies.random_subsetting]
  [#next-free-field: 3]
  """

  use Protobuf,
    full_name: "envoy.extensions.load_balancing_policies.random_subsetting.v3.RandomSubsetting",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :subset_size, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "subsetSize",
    deprecated: false

  field :child_policy, 2,
    type: Envoy.Config.Cluster.V3.LoadBalancingPolicy,
    json_name: "childPolicy",
    deprecated: false
end

defmodule Envoy.Extensions.LoadBalancingPolicies.WrrLocality.V3.WrrLocality do
  @moduledoc """
  Configuration for the wrr_locality LB policy. See the :ref:`load balancing architecture overview
  <arch_overview_load_balancing_types>` for more information.
  [#protodoc-title: Weighted Round Robin Locality-Picking Load Balancing Policy]
  [#extension: envoy.load_balancing_policies.wrr_locality]
  """

  use Protobuf,
    full_name: "envoy.extensions.load_balancing_policies.wrr_locality.v3.WrrLocality",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :endpoint_picking_policy, 1,
    type: Envoy.Config.Cluster.V3.LoadBalancingPolicy,
    json_name: "endpointPickingPolicy",
    deprecated: false
end

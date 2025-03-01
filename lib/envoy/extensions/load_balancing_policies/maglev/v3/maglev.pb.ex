defmodule Envoy.Extensions.LoadBalancingPolicies.Maglev.V3.Maglev do
  @moduledoc """
  This configuration allows the built-in Maglev LB policy to be configured via the LB policy
  extension point. See the :ref:`load balancing architecture overview
  <arch_overview_load_balancing_types>` and :ref:`Maglev<arch_overview_load_balancing_types_maglev>` for more information.
  [#protodoc-title: Maglev Load Balancing Policy]
  [#extension: envoy.load_balancing_policies.maglev]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :table_size, 1,
    type: Google.Protobuf.UInt64Value,
    json_name: "tableSize",
    deprecated: false

  field :consistent_hashing_lb_config, 2,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.ConsistentHashingLbConfig,
    json_name: "consistentHashingLbConfig"

  field :locality_weighted_lb_config, 3,
    type:
      Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig.LocalityWeightedLbConfig,
    json_name: "localityWeightedLbConfig"
end

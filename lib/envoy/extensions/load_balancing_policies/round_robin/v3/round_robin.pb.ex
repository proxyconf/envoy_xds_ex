defmodule Envoy.Extensions.LoadBalancingPolicies.RoundRobin.V3.RoundRobin do
  @moduledoc """
  This configuration allows the built-in ROUND_ROBIN LB policy to be configured via the LB policy
  extension point. See the :ref:`load balancing architecture overview
  <arch_overview_load_balancing_types>` for more information.
  [#protodoc-title: Round Robin Load Balancing Policy]
  [#extension: envoy.load_balancing_policies.round_robin]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :slow_start_config, 1,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.SlowStartConfig,
    json_name: "slowStartConfig"

  field :locality_lb_config, 2,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig,
    json_name: "localityLbConfig"
end

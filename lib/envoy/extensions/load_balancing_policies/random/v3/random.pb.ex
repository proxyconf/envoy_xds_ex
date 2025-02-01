defmodule Envoy.Extensions.LoadBalancingPolicies.Random.V3.Random do
  @moduledoc """
  This configuration allows the built-in Random LB policy to be configured via the LB policy
  extension point. See the :ref:`load balancing architecture overview
  <arch_overview_load_balancing_types>` for more information.
  [#protodoc-title: Random Load Balancing Policy]
  [#extension: envoy.load_balancing_policies.random]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :locality_lb_config, 1,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig,
    json_name: "localityLbConfig"
end

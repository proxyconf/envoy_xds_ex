defmodule Envoy.Extensions.LoadBalancingPolicies.PickFirst.V3.PickFirst do
  @moduledoc """
  This configuration allows the built-in PICK_FIRST LB policy to be configured
  via the LB policy extension point.
  [#protodoc-title: Pick First Load Balancing Policy]
  [#not-implemented-hide:]
  """

  use Protobuf,
    full_name: "envoy.extensions.load_balancing_policies.pick_first.v3.PickFirst",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :shuffle_address_list, 1, type: :bool, json_name: "shuffleAddressList"
end

defmodule Envoy.Extensions.LoadBalancingPolicies.PickFirst.V3.PickFirst do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :shuffle_address_list, 1, type: :bool, json_name: "shuffleAddressList"
end
defmodule Envoy.Extensions.LoadBalancingPolicies.RingHash.V3.RingHash.HashFunction do
  @moduledoc """
  The hash function used to hash hosts onto the ketama ring.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DEFAULT_HASH, 0
  field :XX_HASH, 1
  field :MURMUR_HASH_2, 2
end

defmodule Envoy.Extensions.LoadBalancingPolicies.RingHash.V3.RingHash do
  @moduledoc """
  This configuration allows the built-in RING_HASH LB policy to be configured via the LB policy
  extension point. See the :ref:`load balancing architecture overview
  <arch_overview_load_balancing_types>` for more information.
  [#next-free-field: 8]
  [#protodoc-title: Ring Hash Load Balancing Policy]
  [#extension: envoy.load_balancing_policies.ring_hash]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :hash_function, 1,
    type: Envoy.Extensions.LoadBalancingPolicies.RingHash.V3.RingHash.HashFunction,
    json_name: "hashFunction",
    enum: true,
    deprecated: false

  field :minimum_ring_size, 2,
    type: Google.Protobuf.UInt64Value,
    json_name: "minimumRingSize",
    deprecated: false

  field :maximum_ring_size, 3,
    type: Google.Protobuf.UInt64Value,
    json_name: "maximumRingSize",
    deprecated: false

  field :use_hostname_for_hashing, 4,
    type: :bool,
    json_name: "useHostnameForHashing",
    deprecated: true

  field :hash_balance_factor, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "hashBalanceFactor",
    deprecated: true

  field :consistent_hashing_lb_config, 6,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.ConsistentHashingLbConfig,
    json_name: "consistentHashingLbConfig"

  field :locality_weighted_lb_config, 7,
    type:
      Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig.LocalityWeightedLbConfig,
    json_name: "localityWeightedLbConfig"
end

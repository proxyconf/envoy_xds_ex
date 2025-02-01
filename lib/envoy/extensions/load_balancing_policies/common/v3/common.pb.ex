defmodule Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig.ZoneAwareLbConfig do
  @moduledoc """
  Configuration for :ref:`zone aware routing
  <arch_overview_load_balancing_zone_aware_routing>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :routing_enabled, 1, type: Envoy.Type.V3.Percent, json_name: "routingEnabled"
  field :min_cluster_size, 2, type: Google.Protobuf.UInt64Value, json_name: "minClusterSize"
  field :fail_traffic_on_panic, 3, type: :bool, json_name: "failTrafficOnPanic"
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig.LocalityWeightedLbConfig do
  @moduledoc """
  Configuration for :ref:`locality weighted load balancing
  <arch_overview_load_balancing_locality_weighted_lb>`
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig do
  @moduledoc """
  [#protodoc-title: Common configuration for two or more load balancing policy extensions]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :locality_config_specifier, 0

  field :zone_aware_lb_config, 1,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig.ZoneAwareLbConfig,
    json_name: "zoneAwareLbConfig",
    oneof: 0

  field :locality_weighted_lb_config, 2,
    type:
      Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig.LocalityWeightedLbConfig,
    json_name: "localityWeightedLbConfig",
    oneof: 0
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Common.V3.SlowStartConfig do
  @moduledoc """
  Configuration for :ref:`slow start mode <arch_overview_load_balancing_slow_start>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :slow_start_window, 1, type: Google.Protobuf.Duration, json_name: "slowStartWindow"
  field :aggression, 2, type: Envoy.Config.Core.V3.RuntimeDouble
  field :min_weight_percent, 3, type: Envoy.Type.V3.Percent, json_name: "minWeightPercent"
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Common.V3.ConsistentHashingLbConfig do
  @moduledoc """
  Common Configuration for all consistent hashing load balancers (MaglevLb, RingHashLb, etc.)
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :use_hostname_for_hashing, 1, type: :bool, json_name: "useHostnameForHashing"

  field :hash_balance_factor, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "hashBalanceFactor",
    deprecated: false
end

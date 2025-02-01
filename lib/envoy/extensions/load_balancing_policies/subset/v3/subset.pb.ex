defmodule Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset.LbSubsetFallbackPolicy do
  @moduledoc """
  If NO_FALLBACK is selected, a result
  equivalent to no healthy hosts is reported. If ANY_ENDPOINT is selected,
  any cluster endpoint may be returned (subject to policy, health checks,
  etc). If DEFAULT_SUBSET is selected, load balancing is performed over the
  endpoints matching the values from the default_subset field.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :NO_FALLBACK, 0
  field :ANY_ENDPOINT, 1
  field :DEFAULT_SUBSET, 2
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset.LbSubsetMetadataFallbackPolicy do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :METADATA_NO_FALLBACK, 0
  field :FALLBACK_LIST, 1
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset.LbSubsetSelector.LbSubsetSelectorFallbackPolicy do
  @moduledoc """
  Allows to override top level fallback policy per selector.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :NOT_DEFINED, 0
  field :NO_FALLBACK, 1
  field :ANY_ENDPOINT, 2
  field :DEFAULT_SUBSET, 3
  field :KEYS_SUBSET, 4
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset.LbSubsetSelector do
  @moduledoc """
  Specifications for subsets.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :keys, 1, repeated: true, type: :string
  field :single_host_per_subset, 4, type: :bool, json_name: "singleHostPerSubset"

  field :fallback_policy, 2,
    type:
      Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset.LbSubsetSelector.LbSubsetSelectorFallbackPolicy,
    json_name: "fallbackPolicy",
    enum: true,
    deprecated: false

  field :fallback_keys_subset, 3, repeated: true, type: :string, json_name: "fallbackKeysSubset"
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset do
  @moduledoc """
  Optionally divide the endpoints in this cluster into subsets defined by
  endpoint metadata and selected by route and weighted cluster metadata.
  [#next-free-field: 11]
  [#protodoc-title: Subset Load Balancing Policy]
  [#extension: envoy.load_balancing_policies.subset]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :fallback_policy, 1,
    type: Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset.LbSubsetFallbackPolicy,
    json_name: "fallbackPolicy",
    enum: true,
    deprecated: false

  field :default_subset, 2, type: Google.Protobuf.Struct, json_name: "defaultSubset"

  field :subset_selectors, 3,
    repeated: true,
    type: Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset.LbSubsetSelector,
    json_name: "subsetSelectors"

  field :allow_redundant_keys, 10, type: :bool, json_name: "allowRedundantKeys"
  field :locality_weight_aware, 4, type: :bool, json_name: "localityWeightAware"
  field :scale_locality_weight, 5, type: :bool, json_name: "scaleLocalityWeight"
  field :panic_mode_any, 6, type: :bool, json_name: "panicModeAny"
  field :list_as_any, 7, type: :bool, json_name: "listAsAny"

  field :metadata_fallback_policy, 8,
    type: Envoy.Extensions.LoadBalancingPolicies.Subset.V3.Subset.LbSubsetMetadataFallbackPolicy,
    json_name: "metadataFallbackPolicy",
    enum: true,
    deprecated: false

  field :subset_lb_policy, 9,
    type: Envoy.Config.Cluster.V3.LoadBalancingPolicy,
    json_name: "subsetLbPolicy",
    deprecated: false
end

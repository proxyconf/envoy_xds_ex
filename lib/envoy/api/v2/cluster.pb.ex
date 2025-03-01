defmodule Envoy.Api.V2.Cluster.DiscoveryType do
  @moduledoc """
  Refer to :ref:`service discovery type <arch_overview_service_discovery_types>`
  for an explanation on each type.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :STATIC, 0
  field :STRICT_DNS, 1
  field :LOGICAL_DNS, 2
  field :EDS, 3
  field :ORIGINAL_DST, 4
end

defmodule Envoy.Api.V2.Cluster.LbPolicy do
  @moduledoc """
  Refer to :ref:`load balancer type <arch_overview_load_balancing_types>` architecture
  overview section for information on each type.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ROUND_ROBIN, 0
  field :LEAST_REQUEST, 1
  field :RING_HASH, 2
  field :RANDOM, 3
  field :ORIGINAL_DST_LB, 4
  field :MAGLEV, 5
  field :CLUSTER_PROVIDED, 6
  field :LOAD_BALANCING_POLICY_CONFIG, 7
end

defmodule Envoy.Api.V2.Cluster.DnsLookupFamily do
  @moduledoc """
  When V4_ONLY is selected, the DNS resolver will only perform a lookup for
  addresses in the IPv4 family. If V6_ONLY is selected, the DNS resolver will
  only perform a lookup for addresses in the IPv6 family. If AUTO is
  specified, the DNS resolver will first perform a lookup for addresses in
  the IPv6 family and fallback to a lookup for addresses in the IPv4 family.
  For cluster types other than
  :ref:`STRICT_DNS<envoy_api_enum_value_Cluster.DiscoveryType.STRICT_DNS>` and
  :ref:`LOGICAL_DNS<envoy_api_enum_value_Cluster.DiscoveryType.LOGICAL_DNS>`,
  this setting is
  ignored.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :AUTO, 0
  field :V4_ONLY, 1
  field :V6_ONLY, 2
end

defmodule Envoy.Api.V2.Cluster.ClusterProtocolSelection do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :USE_CONFIGURED_PROTOCOL, 0
  field :USE_DOWNSTREAM_PROTOCOL, 1
end

defmodule Envoy.Api.V2.Cluster.LbSubsetConfig.LbSubsetFallbackPolicy do
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

defmodule Envoy.Api.V2.Cluster.LbSubsetConfig.LbSubsetSelector.LbSubsetSelectorFallbackPolicy do
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

defmodule Envoy.Api.V2.Cluster.RingHashLbConfig.HashFunction do
  @moduledoc """
  The hash function used to hash hosts onto the ketama ring.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :XX_HASH, 0
  field :MURMUR_HASH_2, 1
end

defmodule Envoy.Api.V2.Cluster.TransportSocketMatch do
  @moduledoc """
  TransportSocketMatch specifies what transport socket config will be used
  when the match conditions are satisfied.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :match, 2, type: Google.Protobuf.Struct

  field :transport_socket, 3,
    type: Envoy.Api.V2.Core.TransportSocket,
    json_name: "transportSocket"
end

defmodule Envoy.Api.V2.Cluster.CustomClusterType do
  @moduledoc """
  Extended cluster type.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 2, type: Google.Protobuf.Any, json_name: "typedConfig"
end

defmodule Envoy.Api.V2.Cluster.EdsClusterConfig do
  @moduledoc """
  Only valid when discovery type is EDS.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :eds_config, 1, type: Envoy.Api.V2.Core.ConfigSource, json_name: "edsConfig"
  field :service_name, 2, type: :string, json_name: "serviceName"
end

defmodule Envoy.Api.V2.Cluster.LbSubsetConfig.LbSubsetSelector do
  @moduledoc """
  Specifications for subsets.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :keys, 1, repeated: true, type: :string

  field :fallback_policy, 2,
    type: Envoy.Api.V2.Cluster.LbSubsetConfig.LbSubsetSelector.LbSubsetSelectorFallbackPolicy,
    json_name: "fallbackPolicy",
    enum: true,
    deprecated: false

  field :fallback_keys_subset, 3, repeated: true, type: :string, json_name: "fallbackKeysSubset"
end

defmodule Envoy.Api.V2.Cluster.LbSubsetConfig do
  @moduledoc """
  Optionally divide the endpoints in this cluster into subsets defined by
  endpoint metadata and selected by route and weighted cluster metadata.
  [#next-free-field: 8]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :fallback_policy, 1,
    type: Envoy.Api.V2.Cluster.LbSubsetConfig.LbSubsetFallbackPolicy,
    json_name: "fallbackPolicy",
    enum: true,
    deprecated: false

  field :default_subset, 2, type: Google.Protobuf.Struct, json_name: "defaultSubset"

  field :subset_selectors, 3,
    repeated: true,
    type: Envoy.Api.V2.Cluster.LbSubsetConfig.LbSubsetSelector,
    json_name: "subsetSelectors"

  field :locality_weight_aware, 4, type: :bool, json_name: "localityWeightAware"
  field :scale_locality_weight, 5, type: :bool, json_name: "scaleLocalityWeight"
  field :panic_mode_any, 6, type: :bool, json_name: "panicModeAny"
  field :list_as_any, 7, type: :bool, json_name: "listAsAny"
end

defmodule Envoy.Api.V2.Cluster.LeastRequestLbConfig do
  @moduledoc """
  Specific configuration for the LeastRequest load balancing policy.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :choice_count, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "choiceCount",
    deprecated: false
end

defmodule Envoy.Api.V2.Cluster.RingHashLbConfig do
  @moduledoc """
  Specific configuration for the :ref:`RingHash<arch_overview_load_balancing_types_ring_hash>`
  load balancing policy.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :minimum_ring_size, 1,
    type: Google.Protobuf.UInt64Value,
    json_name: "minimumRingSize",
    deprecated: false

  field :hash_function, 3,
    type: Envoy.Api.V2.Cluster.RingHashLbConfig.HashFunction,
    json_name: "hashFunction",
    enum: true,
    deprecated: false

  field :maximum_ring_size, 4,
    type: Google.Protobuf.UInt64Value,
    json_name: "maximumRingSize",
    deprecated: false
end

defmodule Envoy.Api.V2.Cluster.OriginalDstLbConfig do
  @moduledoc """
  Specific configuration for the
  :ref:`Original Destination <arch_overview_load_balancing_types_original_destination>`
  load balancing policy.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :use_http_header, 1, type: :bool, json_name: "useHttpHeader"
end

defmodule Envoy.Api.V2.Cluster.CommonLbConfig.ZoneAwareLbConfig do
  @moduledoc """
  Configuration for :ref:`zone aware routing
  <arch_overview_load_balancing_zone_aware_routing>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :routing_enabled, 1, type: Envoy.Type.Percent, json_name: "routingEnabled"
  field :min_cluster_size, 2, type: Google.Protobuf.UInt64Value, json_name: "minClusterSize"
  field :fail_traffic_on_panic, 3, type: :bool, json_name: "failTrafficOnPanic"
end

defmodule Envoy.Api.V2.Cluster.CommonLbConfig.LocalityWeightedLbConfig do
  @moduledoc """
  Configuration for :ref:`locality weighted load balancing
  <arch_overview_load_balancing_locality_weighted_lb>`
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Api.V2.Cluster.CommonLbConfig.ConsistentHashingLbConfig do
  @moduledoc """
  Common Configuration for all consistent hashing load balancers (MaglevLb, RingHashLb, etc.)
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :use_hostname_for_hashing, 1, type: :bool, json_name: "useHostnameForHashing"
end

defmodule Envoy.Api.V2.Cluster.CommonLbConfig do
  @moduledoc """
  Common configuration for all load balancer implementations.
  [#next-free-field: 8]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :locality_config_specifier, 0

  field :healthy_panic_threshold, 1, type: Envoy.Type.Percent, json_name: "healthyPanicThreshold"

  field :zone_aware_lb_config, 2,
    type: Envoy.Api.V2.Cluster.CommonLbConfig.ZoneAwareLbConfig,
    json_name: "zoneAwareLbConfig",
    oneof: 0

  field :locality_weighted_lb_config, 3,
    type: Envoy.Api.V2.Cluster.CommonLbConfig.LocalityWeightedLbConfig,
    json_name: "localityWeightedLbConfig",
    oneof: 0

  field :update_merge_window, 4, type: Google.Protobuf.Duration, json_name: "updateMergeWindow"
  field :ignore_new_hosts_until_first_hc, 5, type: :bool, json_name: "ignoreNewHostsUntilFirstHc"

  field :close_connections_on_host_set_change, 6,
    type: :bool,
    json_name: "closeConnectionsOnHostSetChange"

  field :consistent_hashing_lb_config, 7,
    type: Envoy.Api.V2.Cluster.CommonLbConfig.ConsistentHashingLbConfig,
    json_name: "consistentHashingLbConfig"
end

defmodule Envoy.Api.V2.Cluster.RefreshRate do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :base_interval, 1,
    type: Google.Protobuf.Duration,
    json_name: "baseInterval",
    deprecated: false

  field :max_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "maxInterval",
    deprecated: false
end

defmodule Envoy.Api.V2.Cluster.ExtensionProtocolOptionsEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Api.V2.Cluster.TypedExtensionProtocolOptionsEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Api.V2.Cluster do
  @moduledoc """
  Configuration for a single upstream cluster.
  [#next-free-field: 48]
  [#protodoc-title: Cluster configuration]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :cluster_discovery_type, 0

  oneof :lb_config, 1

  field :transport_socket_matches, 43,
    repeated: true,
    type: Envoy.Api.V2.Cluster.TransportSocketMatch,
    json_name: "transportSocketMatches"

  field :name, 1, type: :string, deprecated: false
  field :alt_stat_name, 28, type: :string, json_name: "altStatName"

  field :type, 2,
    type: Envoy.Api.V2.Cluster.DiscoveryType,
    enum: true,
    oneof: 0,
    deprecated: false

  field :cluster_type, 38,
    type: Envoy.Api.V2.Cluster.CustomClusterType,
    json_name: "clusterType",
    oneof: 0

  field :eds_cluster_config, 3,
    type: Envoy.Api.V2.Cluster.EdsClusterConfig,
    json_name: "edsClusterConfig"

  field :connect_timeout, 4,
    type: Google.Protobuf.Duration,
    json_name: "connectTimeout",
    deprecated: false

  field :per_connection_buffer_limit_bytes, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "perConnectionBufferLimitBytes"

  field :lb_policy, 6,
    type: Envoy.Api.V2.Cluster.LbPolicy,
    json_name: "lbPolicy",
    enum: true,
    deprecated: false

  field :hosts, 7, repeated: true, type: Envoy.Api.V2.Core.Address, deprecated: true

  field :load_assignment, 33,
    type: Envoy.Api.V2.ClusterLoadAssignment,
    json_name: "loadAssignment"

  field :health_checks, 8,
    repeated: true,
    type: Envoy.Api.V2.Core.HealthCheck,
    json_name: "healthChecks"

  field :max_requests_per_connection, 9,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxRequestsPerConnection"

  field :circuit_breakers, 10,
    type: Envoy.Api.V2.Cluster.CircuitBreakers,
    json_name: "circuitBreakers"

  field :tls_context, 11,
    type: Envoy.Api.V2.Auth.UpstreamTlsContext,
    json_name: "tlsContext",
    deprecated: true

  field :upstream_http_protocol_options, 46,
    type: Envoy.Api.V2.Core.UpstreamHttpProtocolOptions,
    json_name: "upstreamHttpProtocolOptions"

  field :common_http_protocol_options, 29,
    type: Envoy.Api.V2.Core.HttpProtocolOptions,
    json_name: "commonHttpProtocolOptions"

  field :http_protocol_options, 13,
    type: Envoy.Api.V2.Core.Http1ProtocolOptions,
    json_name: "httpProtocolOptions"

  field :http2_protocol_options, 14,
    type: Envoy.Api.V2.Core.Http2ProtocolOptions,
    json_name: "http2ProtocolOptions"

  field :extension_protocol_options, 35,
    repeated: true,
    type: Envoy.Api.V2.Cluster.ExtensionProtocolOptionsEntry,
    json_name: "extensionProtocolOptions",
    map: true,
    deprecated: true

  field :typed_extension_protocol_options, 36,
    repeated: true,
    type: Envoy.Api.V2.Cluster.TypedExtensionProtocolOptionsEntry,
    json_name: "typedExtensionProtocolOptions",
    map: true

  field :dns_refresh_rate, 16,
    type: Google.Protobuf.Duration,
    json_name: "dnsRefreshRate",
    deprecated: false

  field :dns_failure_refresh_rate, 44,
    type: Envoy.Api.V2.Cluster.RefreshRate,
    json_name: "dnsFailureRefreshRate"

  field :respect_dns_ttl, 39, type: :bool, json_name: "respectDnsTtl"

  field :dns_lookup_family, 17,
    type: Envoy.Api.V2.Cluster.DnsLookupFamily,
    json_name: "dnsLookupFamily",
    enum: true,
    deprecated: false

  field :dns_resolvers, 18,
    repeated: true,
    type: Envoy.Api.V2.Core.Address,
    json_name: "dnsResolvers"

  field :use_tcp_for_dns_lookups, 45, type: :bool, json_name: "useTcpForDnsLookups"

  field :outlier_detection, 19,
    type: Envoy.Api.V2.Cluster.OutlierDetection,
    json_name: "outlierDetection"

  field :cleanup_interval, 20,
    type: Google.Protobuf.Duration,
    json_name: "cleanupInterval",
    deprecated: false

  field :upstream_bind_config, 21,
    type: Envoy.Api.V2.Core.BindConfig,
    json_name: "upstreamBindConfig"

  field :lb_subset_config, 22,
    type: Envoy.Api.V2.Cluster.LbSubsetConfig,
    json_name: "lbSubsetConfig"

  field :ring_hash_lb_config, 23,
    type: Envoy.Api.V2.Cluster.RingHashLbConfig,
    json_name: "ringHashLbConfig",
    oneof: 1

  field :original_dst_lb_config, 34,
    type: Envoy.Api.V2.Cluster.OriginalDstLbConfig,
    json_name: "originalDstLbConfig",
    oneof: 1

  field :least_request_lb_config, 37,
    type: Envoy.Api.V2.Cluster.LeastRequestLbConfig,
    json_name: "leastRequestLbConfig",
    oneof: 1

  field :common_lb_config, 27,
    type: Envoy.Api.V2.Cluster.CommonLbConfig,
    json_name: "commonLbConfig"

  field :transport_socket, 24,
    type: Envoy.Api.V2.Core.TransportSocket,
    json_name: "transportSocket"

  field :metadata, 25, type: Envoy.Api.V2.Core.Metadata

  field :protocol_selection, 26,
    type: Envoy.Api.V2.Cluster.ClusterProtocolSelection,
    json_name: "protocolSelection",
    enum: true

  field :upstream_connection_options, 30,
    type: Envoy.Api.V2.UpstreamConnectionOptions,
    json_name: "upstreamConnectionOptions"

  field :close_connections_on_host_health_failure, 31,
    type: :bool,
    json_name: "closeConnectionsOnHostHealthFailure"

  field :drain_connections_on_host_removal, 32,
    type: :bool,
    json_name: "drainConnectionsOnHostRemoval",
    deprecated: false

  field :filters, 40, repeated: true, type: Envoy.Api.V2.Cluster.Filter

  field :load_balancing_policy, 41,
    type: Envoy.Api.V2.LoadBalancingPolicy,
    json_name: "loadBalancingPolicy"

  field :lrs_server, 42, type: Envoy.Api.V2.Core.ConfigSource, json_name: "lrsServer"
  field :track_timeout_budgets, 47, type: :bool, json_name: "trackTimeoutBudgets"
end

defmodule Envoy.Api.V2.LoadBalancingPolicy.Policy do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string
  field :config, 2, type: Google.Protobuf.Struct, deprecated: true
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig"
end

defmodule Envoy.Api.V2.LoadBalancingPolicy do
  @moduledoc """
  [#not-implemented-hide:] Extensible load balancing policy configuration.

  Every LB policy defined via this mechanism will be identified via a unique name using reverse
  DNS notation. If the policy needs configuration parameters, it must define a message for its
  own configuration, which will be stored in the config field. The name of the policy will tell
  clients which type of message they should expect to see in the config field.

  Note that there are cases where it is useful to be able to independently select LB policies
  for choosing a locality and for choosing an endpoint within that locality. For example, a
  given deployment may always use the same policy to choose the locality, but for choosing the
  endpoint within the locality, some clusters may use weighted-round-robin, while others may
  use some sort of session-based balancing.

  This can be accomplished via hierarchical LB policies, where the parent LB policy creates a
  child LB policy for each locality. For each request, the parent chooses the locality and then
  delegates to the child policy for that locality to choose the endpoint within the locality.

  To facilitate this, the config message for the top-level LB policy may include a field of
  type LoadBalancingPolicy that specifies the child policy.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :policies, 1, repeated: true, type: Envoy.Api.V2.LoadBalancingPolicy.Policy
end

defmodule Envoy.Api.V2.UpstreamBindConfig do
  @moduledoc """
  An extensible structure containing the address Envoy should bind to when
  establishing upstream connections.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :source_address, 1, type: Envoy.Api.V2.Core.Address, json_name: "sourceAddress"
end

defmodule Envoy.Api.V2.UpstreamConnectionOptions do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :tcp_keepalive, 1, type: Envoy.Api.V2.Core.TcpKeepalive, json_name: "tcpKeepalive"
end

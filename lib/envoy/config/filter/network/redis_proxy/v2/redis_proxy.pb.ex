defmodule Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.ConnPoolSettings.ReadPolicy do
  @moduledoc """
  ReadPolicy controls how Envoy routes read commands to Redis nodes. This is currently
  supported for Redis Cluster. All ReadPolicy settings except MASTER may return stale data
  because replication is asynchronous and requires some delay. You need to ensure that your
  application can tolerate stale data.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :MASTER, 0
  field :PREFER_MASTER, 1
  field :REPLICA, 2
  field :PREFER_REPLICA, 3
  field :ANY, 4
end

defmodule Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.ConnPoolSettings do
  @moduledoc """
  Redis connection pool settings.
  [#next-free-field: 9]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :op_timeout, 1, type: Google.Protobuf.Duration, json_name: "opTimeout", deprecated: false
  field :enable_hashtagging, 2, type: :bool, json_name: "enableHashtagging"
  field :enable_redirection, 3, type: :bool, json_name: "enableRedirection"
  field :max_buffer_size_before_flush, 4, type: :uint32, json_name: "maxBufferSizeBeforeFlush"
  field :buffer_flush_timeout, 5, type: Google.Protobuf.Duration, json_name: "bufferFlushTimeout"

  field :max_upstream_unknown_connections, 6,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxUpstreamUnknownConnections"

  field :enable_command_stats, 8, type: :bool, json_name: "enableCommandStats"

  field :read_policy, 7,
    type: Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.ConnPoolSettings.ReadPolicy,
    json_name: "readPolicy",
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes.Route.RequestMirrorPolicy do
  @moduledoc """
  The router is capable of shadowing traffic from one cluster to another. The current
  implementation is "fire and forget," meaning Envoy will not wait for the shadow cluster to
  respond before returning the response from the primary cluster. All normal statistics are
  collected for the shadow cluster making this feature useful for testing.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cluster, 1, type: :string, deprecated: false

  field :runtime_fraction, 2,
    type: Envoy.Api.V2.Core.RuntimeFractionalPercent,
    json_name: "runtimeFraction"

  field :exclude_read_commands, 3, type: :bool, json_name: "excludeReadCommands"
end

defmodule Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes.Route do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :prefix, 1, type: :string
  field :remove_prefix, 2, type: :bool, json_name: "removePrefix"
  field :cluster, 3, type: :string, deprecated: false

  field :request_mirror_policy, 4,
    repeated: true,
    type:
      Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes.Route.RequestMirrorPolicy,
    json_name: "requestMirrorPolicy"
end

defmodule Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :routes, 1,
    repeated: true,
    type: Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes.Route

  field :case_insensitive, 2, type: :bool, json_name: "caseInsensitive"
  field :catch_all_cluster, 3, type: :string, json_name: "catchAllCluster", deprecated: true

  field :catch_all_route, 4,
    type: Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes.Route,
    json_name: "catchAllRoute"
end

defmodule Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy do
  @moduledoc """
  [#next-free-field: 7]
  [#protodoc-title: Redis Proxy]
  Redis Proxy :ref:`configuration overview <config_network_filters_redis_proxy>`.
  [#extension: envoy.filters.network.redis_proxy]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :cluster, 2, type: :string, deprecated: true

  field :settings, 3,
    type: Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.ConnPoolSettings,
    deprecated: false

  field :latency_in_micros, 4, type: :bool, json_name: "latencyInMicros"

  field :prefix_routes, 5,
    type: Envoy.Config.Filter.Network.RedisProxy.V2.RedisProxy.PrefixRoutes,
    json_name: "prefixRoutes"

  field :downstream_auth_password, 6,
    type: Envoy.Api.V2.Core.DataSource,
    json_name: "downstreamAuthPassword",
    deprecated: false
end

defmodule Envoy.Config.Filter.Network.RedisProxy.V2.RedisProtocolOptions do
  @moduledoc """
  RedisProtocolOptions specifies Redis upstream protocol options. This object is used in
  :ref:`typed_extension_protocol_options<envoy_api_field_Cluster.typed_extension_protocol_options>`,
  keyed by the name `envoy.filters.network.redis_proxy`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :auth_password, 1,
    type: Envoy.Api.V2.Core.DataSource,
    json_name: "authPassword",
    deprecated: false
end

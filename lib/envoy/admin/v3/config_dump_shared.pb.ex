defmodule Envoy.Admin.V3.ClientResourceStatus do
  @moduledoc """
  Resource status from the view of a xDS client, which tells the synchronization
  status between the xDS client and the xDS server.
  [#protodoc-title: ConfigDump]
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNKNOWN, 0
  field :REQUESTED, 1
  field :DOES_NOT_EXIST, 2
  field :ACKED, 3
  field :NACKED, 4
  field :RECEIVED_ERROR, 5
  field :TIMEOUT, 6
end

defmodule Envoy.Admin.V3.UpdateFailureState do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :failed_configuration, 1, type: Google.Protobuf.Any, json_name: "failedConfiguration"
  field :last_update_attempt, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdateAttempt"
  field :details, 3, type: :string
  field :version_info, 4, type: :string, json_name: "versionInfo"
end

defmodule Envoy.Admin.V3.ListenersConfigDump.StaticListener do
  @moduledoc """
  Describes a statically loaded listener.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :listener, 1, type: Google.Protobuf.Any
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :listener, 2, type: Google.Protobuf.Any
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V3.ListenersConfigDump.DynamicListener do
  @moduledoc """
  Describes a dynamically loaded listener via the LDS API.
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string

  field :active_state, 2,
    type: Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState,
    json_name: "activeState"

  field :warming_state, 3,
    type: Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState,
    json_name: "warmingState"

  field :draining_state, 4,
    type: Envoy.Admin.V3.ListenersConfigDump.DynamicListenerState,
    json_name: "drainingState"

  field :error_state, 5, type: Envoy.Admin.V3.UpdateFailureState, json_name: "errorState"

  field :client_status, 6,
    type: Envoy.Admin.V3.ClientResourceStatus,
    json_name: "clientStatus",
    enum: true
end

defmodule Envoy.Admin.V3.ListenersConfigDump do
  @moduledoc """
  Envoy's listener manager fills this message with all currently known listeners. Listener
  configuration information can be used to recreate an Envoy configuration by populating all
  listeners as static listeners or by returning them in a LDS response.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version_info, 1, type: :string, json_name: "versionInfo"

  field :static_listeners, 2,
    repeated: true,
    type: Envoy.Admin.V3.ListenersConfigDump.StaticListener,
    json_name: "staticListeners"

  field :dynamic_listeners, 3,
    repeated: true,
    type: Envoy.Admin.V3.ListenersConfigDump.DynamicListener,
    json_name: "dynamicListeners"
end

defmodule Envoy.Admin.V3.ClustersConfigDump.StaticCluster do
  @moduledoc """
  Describes a statically loaded cluster.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cluster, 1, type: Google.Protobuf.Any
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V3.ClustersConfigDump.DynamicCluster do
  @moduledoc """
  Describes a dynamically loaded cluster via the CDS API.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :cluster, 2, type: Google.Protobuf.Any
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :error_state, 4, type: Envoy.Admin.V3.UpdateFailureState, json_name: "errorState"

  field :client_status, 5,
    type: Envoy.Admin.V3.ClientResourceStatus,
    json_name: "clientStatus",
    enum: true
end

defmodule Envoy.Admin.V3.ClustersConfigDump do
  @moduledoc """
  Envoy's cluster manager fills this message with all currently known clusters. Cluster
  configuration information can be used to recreate an Envoy configuration by populating all
  clusters as static clusters or by returning them in a CDS response.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version_info, 1, type: :string, json_name: "versionInfo"

  field :static_clusters, 2,
    repeated: true,
    type: Envoy.Admin.V3.ClustersConfigDump.StaticCluster,
    json_name: "staticClusters"

  field :dynamic_active_clusters, 3,
    repeated: true,
    type: Envoy.Admin.V3.ClustersConfigDump.DynamicCluster,
    json_name: "dynamicActiveClusters"

  field :dynamic_warming_clusters, 4,
    repeated: true,
    type: Envoy.Admin.V3.ClustersConfigDump.DynamicCluster,
    json_name: "dynamicWarmingClusters"
end

defmodule Envoy.Admin.V3.RoutesConfigDump.StaticRouteConfig do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :route_config, 1, type: Google.Protobuf.Any, json_name: "routeConfig"
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V3.RoutesConfigDump.DynamicRouteConfig do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :route_config, 2, type: Google.Protobuf.Any, json_name: "routeConfig"
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :error_state, 4, type: Envoy.Admin.V3.UpdateFailureState, json_name: "errorState"

  field :client_status, 5,
    type: Envoy.Admin.V3.ClientResourceStatus,
    json_name: "clientStatus",
    enum: true
end

defmodule Envoy.Admin.V3.RoutesConfigDump do
  @moduledoc """
  Envoy's RDS implementation fills this message with all currently loaded routes, as described by
  their RouteConfiguration objects. Static routes that are either defined in the bootstrap configuration
  or defined inline while configuring listeners are separated from those configured dynamically via RDS.
  Route configuration information can be used to recreate an Envoy configuration by populating all routes
  as static routes or by returning them in RDS responses.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :static_route_configs, 2,
    repeated: true,
    type: Envoy.Admin.V3.RoutesConfigDump.StaticRouteConfig,
    json_name: "staticRouteConfigs"

  field :dynamic_route_configs, 3,
    repeated: true,
    type: Envoy.Admin.V3.RoutesConfigDump.DynamicRouteConfig,
    json_name: "dynamicRouteConfigs"
end

defmodule Envoy.Admin.V3.ScopedRoutesConfigDump.InlineScopedRouteConfigs do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string

  field :scoped_route_configs, 2,
    repeated: true,
    type: Google.Protobuf.Any,
    json_name: "scopedRouteConfigs"

  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V3.ScopedRoutesConfigDump.DynamicScopedRouteConfigs do
  @moduledoc """
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string
  field :version_info, 2, type: :string, json_name: "versionInfo"

  field :scoped_route_configs, 3,
    repeated: true,
    type: Google.Protobuf.Any,
    json_name: "scopedRouteConfigs"

  field :last_updated, 4, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :error_state, 5, type: Envoy.Admin.V3.UpdateFailureState, json_name: "errorState"

  field :client_status, 6,
    type: Envoy.Admin.V3.ClientResourceStatus,
    json_name: "clientStatus",
    enum: true
end

defmodule Envoy.Admin.V3.ScopedRoutesConfigDump do
  @moduledoc """
  Envoy's scoped RDS implementation fills this message with all currently loaded route
  configuration scopes (defined via ScopedRouteConfigurationsSet protos). This message lists both
  the scopes defined inline with the higher order object (i.e., the HttpConnectionManager) and the
  dynamically obtained scopes via the SRDS API.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :inline_scoped_route_configs, 1,
    repeated: true,
    type: Envoy.Admin.V3.ScopedRoutesConfigDump.InlineScopedRouteConfigs,
    json_name: "inlineScopedRouteConfigs"

  field :dynamic_scoped_route_configs, 2,
    repeated: true,
    type: Envoy.Admin.V3.ScopedRoutesConfigDump.DynamicScopedRouteConfigs,
    json_name: "dynamicScopedRouteConfigs"
end

defmodule Envoy.Admin.V3.EndpointsConfigDump.StaticEndpointConfig do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :endpoint_config, 1, type: Google.Protobuf.Any, json_name: "endpointConfig"
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V3.EndpointsConfigDump.DynamicEndpointConfig do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :endpoint_config, 2, type: Google.Protobuf.Any, json_name: "endpointConfig"
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :error_state, 4, type: Envoy.Admin.V3.UpdateFailureState, json_name: "errorState"

  field :client_status, 5,
    type: Envoy.Admin.V3.ClientResourceStatus,
    json_name: "clientStatus",
    enum: true
end

defmodule Envoy.Admin.V3.EndpointsConfigDump do
  @moduledoc """
  Envoy's admin fill this message with all currently known endpoints. Endpoint
  configuration information can be used to recreate an Envoy configuration by populating all
  endpoints as static endpoints or by returning them in an EDS response.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :static_endpoint_configs, 2,
    repeated: true,
    type: Envoy.Admin.V3.EndpointsConfigDump.StaticEndpointConfig,
    json_name: "staticEndpointConfigs"

  field :dynamic_endpoint_configs, 3,
    repeated: true,
    type: Envoy.Admin.V3.EndpointsConfigDump.DynamicEndpointConfig,
    json_name: "dynamicEndpointConfigs"
end

defmodule Envoy.Admin.V3.EcdsConfigDump.EcdsFilterConfig do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :ecds_filter, 2, type: Google.Protobuf.Any, json_name: "ecdsFilter"
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :error_state, 4, type: Envoy.Admin.V3.UpdateFailureState, json_name: "errorState"

  field :client_status, 5,
    type: Envoy.Admin.V3.ClientResourceStatus,
    json_name: "clientStatus",
    enum: true
end

defmodule Envoy.Admin.V3.EcdsConfigDump do
  @moduledoc """
  Envoy's ECDS service fills this message with all currently extension
  configuration. Extension configuration information can be used to recreate
  an Envoy ECDS listener and HTTP filters as static filters or by returning
  them in ECDS response.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ecds_filters, 1,
    repeated: true,
    type: Envoy.Admin.V3.EcdsConfigDump.EcdsFilterConfig,
    json_name: "ecdsFilters"
end

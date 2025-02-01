defmodule Envoy.Admin.V2alpha.ConfigDump do
  @moduledoc """
  The :ref:`/config_dump <operations_admin_interface_config_dump>` admin endpoint uses this wrapper
  message to maintain and serve arbitrary configuration information from any component in Envoy.
  [#protodoc-title: ConfigDump]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :configs, 1, repeated: true, type: Google.Protobuf.Any
end

defmodule Envoy.Admin.V2alpha.UpdateFailureState do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :failed_configuration, 1, type: Google.Protobuf.Any, json_name: "failedConfiguration"
  field :last_update_attempt, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdateAttempt"
  field :details, 3, type: :string
end

defmodule Envoy.Admin.V2alpha.BootstrapConfigDump do
  @moduledoc """
  This message describes the bootstrap configuration that Envoy was started with. This includes
  any CLI overrides that were merged. Bootstrap configuration information can be used to recreate
  the static portions of an Envoy configuration by reusing the output as the bootstrap
  configuration for another Envoy.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :bootstrap, 1, type: Envoy.Config.Bootstrap.V2.Bootstrap
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.ListenersConfigDump.StaticListener do
  @moduledoc """
  Describes a statically loaded listener.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :listener, 1, type: Google.Protobuf.Any
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :listener, 2, type: Google.Protobuf.Any
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListener do
  @moduledoc """
  Describes a dynamically loaded listener via the LDS API.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string

  field :active_state, 2,
    type: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState,
    json_name: "activeState"

  field :warming_state, 3,
    type: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState,
    json_name: "warmingState"

  field :draining_state, 4,
    type: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListenerState,
    json_name: "drainingState"

  field :error_state, 5, type: Envoy.Admin.V2alpha.UpdateFailureState, json_name: "errorState"
end

defmodule Envoy.Admin.V2alpha.ListenersConfigDump do
  @moduledoc """
  Envoy's listener manager fills this message with all currently known listeners. Listener
  configuration information can be used to recreate an Envoy configuration by populating all
  listeners as static listeners or by returning them in a LDS response.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version_info, 1, type: :string, json_name: "versionInfo"

  field :static_listeners, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.ListenersConfigDump.StaticListener,
    json_name: "staticListeners"

  field :dynamic_listeners, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.ListenersConfigDump.DynamicListener,
    json_name: "dynamicListeners"
end

defmodule Envoy.Admin.V2alpha.ClustersConfigDump.StaticCluster do
  @moduledoc """
  Describes a statically loaded cluster.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cluster, 1, type: Google.Protobuf.Any
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.ClustersConfigDump.DynamicCluster do
  @moduledoc """
  Describes a dynamically loaded cluster via the CDS API.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :cluster, 2, type: Google.Protobuf.Any
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.ClustersConfigDump do
  @moduledoc """
  Envoy's cluster manager fills this message with all currently known clusters. Cluster
  configuration information can be used to recreate an Envoy configuration by populating all
  clusters as static clusters or by returning them in a CDS response.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version_info, 1, type: :string, json_name: "versionInfo"

  field :static_clusters, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.ClustersConfigDump.StaticCluster,
    json_name: "staticClusters"

  field :dynamic_active_clusters, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.ClustersConfigDump.DynamicCluster,
    json_name: "dynamicActiveClusters"

  field :dynamic_warming_clusters, 4,
    repeated: true,
    type: Envoy.Admin.V2alpha.ClustersConfigDump.DynamicCluster,
    json_name: "dynamicWarmingClusters"
end

defmodule Envoy.Admin.V2alpha.RoutesConfigDump.StaticRouteConfig do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :route_config, 1, type: Google.Protobuf.Any, json_name: "routeConfig"
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.RoutesConfigDump.DynamicRouteConfig do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :route_config, 2, type: Google.Protobuf.Any, json_name: "routeConfig"
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.RoutesConfigDump do
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
    type: Envoy.Admin.V2alpha.RoutesConfigDump.StaticRouteConfig,
    json_name: "staticRouteConfigs"

  field :dynamic_route_configs, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.RoutesConfigDump.DynamicRouteConfig,
    json_name: "dynamicRouteConfigs"
end

defmodule Envoy.Admin.V2alpha.ScopedRoutesConfigDump.InlineScopedRouteConfigs do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string

  field :scoped_route_configs, 2,
    repeated: true,
    type: Google.Protobuf.Any,
    json_name: "scopedRouteConfigs"

  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.ScopedRoutesConfigDump.DynamicScopedRouteConfigs do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string
  field :version_info, 2, type: :string, json_name: "versionInfo"

  field :scoped_route_configs, 3,
    repeated: true,
    type: Google.Protobuf.Any,
    json_name: "scopedRouteConfigs"

  field :last_updated, 4, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
end

defmodule Envoy.Admin.V2alpha.ScopedRoutesConfigDump do
  @moduledoc """
  Envoy's scoped RDS implementation fills this message with all currently loaded route
  configuration scopes (defined via ScopedRouteConfigurationsSet protos). This message lists both
  the scopes defined inline with the higher order object (i.e., the HttpConnectionManager) and the
  dynamically obtained scopes via the SRDS API.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :inline_scoped_route_configs, 1,
    repeated: true,
    type: Envoy.Admin.V2alpha.ScopedRoutesConfigDump.InlineScopedRouteConfigs,
    json_name: "inlineScopedRouteConfigs"

  field :dynamic_scoped_route_configs, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.ScopedRoutesConfigDump.DynamicScopedRouteConfigs,
    json_name: "dynamicScopedRouteConfigs"
end

defmodule Envoy.Admin.V2alpha.SecretsConfigDump.DynamicSecret do
  @moduledoc """
  DynamicSecret contains secret information fetched via SDS.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string
  field :version_info, 2, type: :string, json_name: "versionInfo"
  field :last_updated, 3, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :secret, 4, type: Google.Protobuf.Any
end

defmodule Envoy.Admin.V2alpha.SecretsConfigDump.StaticSecret do
  @moduledoc """
  StaticSecret specifies statically loaded secret in bootstrap.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string
  field :last_updated, 2, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"
  field :secret, 3, type: Google.Protobuf.Any
end

defmodule Envoy.Admin.V2alpha.SecretsConfigDump do
  @moduledoc """
  Envoys SDS implementation fills this message with all secrets fetched dynamically via SDS.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :static_secrets, 1,
    repeated: true,
    type: Envoy.Admin.V2alpha.SecretsConfigDump.StaticSecret,
    json_name: "staticSecrets"

  field :dynamic_active_secrets, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.SecretsConfigDump.DynamicSecret,
    json_name: "dynamicActiveSecrets"

  field :dynamic_warming_secrets, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.SecretsConfigDump.DynamicSecret,
    json_name: "dynamicWarmingSecrets"
end

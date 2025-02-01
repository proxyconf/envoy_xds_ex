defmodule Envoy.Service.Status.V3.ConfigStatus do
  @moduledoc """
  Status of a config from a management server view.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNKNOWN, 0
  field :SYNCED, 1
  field :NOT_SENT, 2
  field :STALE, 3
  field :ERROR, 4
end

defmodule Envoy.Service.Status.V3.ClientConfigStatus do
  @moduledoc """
  Config status from a client-side view.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :CLIENT_UNKNOWN, 0
  field :CLIENT_REQUESTED, 1
  field :CLIENT_ACKED, 2
  field :CLIENT_NACKED, 3
  field :CLIENT_RECEIVED_ERROR, 4
end

defmodule Envoy.Service.Status.V3.ClientStatusRequest do
  @moduledoc """
  Request for client status of clients identified by a list of NodeMatchers.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node_matchers, 1,
    repeated: true,
    type: Envoy.Type.Matcher.V3.NodeMatcher,
    json_name: "nodeMatchers"

  field :node, 2, type: Envoy.Config.Core.V3.Node
  field :exclude_resource_contents, 3, type: :bool, json_name: "excludeResourceContents"
end

defmodule Envoy.Service.Status.V3.PerXdsConfig do
  @moduledoc """
  Detailed config (per xDS) with status.
  [#next-free-field: 8]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :per_xds_config, 0

  field :status, 1, type: Envoy.Service.Status.V3.ConfigStatus, enum: true

  field :client_status, 7,
    type: Envoy.Service.Status.V3.ClientConfigStatus,
    json_name: "clientStatus",
    enum: true,
    deprecated: true

  field :listener_config, 2,
    type: Envoy.Admin.V3.ListenersConfigDump,
    json_name: "listenerConfig",
    oneof: 0

  field :cluster_config, 3,
    type: Envoy.Admin.V3.ClustersConfigDump,
    json_name: "clusterConfig",
    oneof: 0

  field :route_config, 4,
    type: Envoy.Admin.V3.RoutesConfigDump,
    json_name: "routeConfig",
    oneof: 0

  field :scoped_route_config, 5,
    type: Envoy.Admin.V3.ScopedRoutesConfigDump,
    json_name: "scopedRouteConfig",
    oneof: 0

  field :endpoint_config, 6,
    type: Envoy.Admin.V3.EndpointsConfigDump,
    json_name: "endpointConfig",
    oneof: 0
end

defmodule Envoy.Service.Status.V3.ClientConfig.GenericXdsConfig do
  @moduledoc """
  GenericXdsConfig is used to specify the config status and the dump
  of any xDS resource identified by their type URL. It is the generalized
  version of the now deprecated ListenersConfigDump, ClustersConfigDump etc
  [#next-free-field: 10]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :type_url, 1, type: :string, json_name: "typeUrl"
  field :name, 2, type: :string
  field :version_info, 3, type: :string, json_name: "versionInfo"
  field :xds_config, 4, type: Google.Protobuf.Any, json_name: "xdsConfig"
  field :last_updated, 5, type: Google.Protobuf.Timestamp, json_name: "lastUpdated"

  field :config_status, 6,
    type: Envoy.Service.Status.V3.ConfigStatus,
    json_name: "configStatus",
    enum: true

  field :client_status, 7,
    type: Envoy.Admin.V3.ClientResourceStatus,
    json_name: "clientStatus",
    enum: true

  field :error_state, 8, type: Envoy.Admin.V3.UpdateFailureState, json_name: "errorState"
  field :is_static_resource, 9, type: :bool, json_name: "isStaticResource"
end

defmodule Envoy.Service.Status.V3.ClientConfig do
  @moduledoc """
  All xds configs for a particular client.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node, 1, type: Envoy.Config.Core.V3.Node

  field :xds_config, 2,
    repeated: true,
    type: Envoy.Service.Status.V3.PerXdsConfig,
    json_name: "xdsConfig",
    deprecated: true

  field :generic_xds_configs, 3,
    repeated: true,
    type: Envoy.Service.Status.V3.ClientConfig.GenericXdsConfig,
    json_name: "genericXdsConfigs"

  field :client_scope, 4, type: :string, json_name: "clientScope"
end

defmodule Envoy.Service.Status.V3.ClientStatusResponse do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :config, 1, repeated: true, type: Envoy.Service.Status.V3.ClientConfig
end

defmodule Envoy.Service.Status.V3.ClientStatusDiscoveryService.Service do
  @moduledoc """
  CSDS is Client Status Discovery Service. It can be used to get the status of
  an xDS-compliant client from the management server's point of view. It can
  also be used to get the current xDS states directly from the client.
  [#protodoc-title: Client status discovery service (CSDS)]
  """

  use GRPC.Service,
    name: "envoy.service.status.v3.ClientStatusDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamClientStatus,
      stream(Envoy.Service.Status.V3.ClientStatusRequest),
      stream(Envoy.Service.Status.V3.ClientStatusResponse)

  rpc :FetchClientStatus,
      Envoy.Service.Status.V3.ClientStatusRequest,
      Envoy.Service.Status.V3.ClientStatusResponse
end

defmodule Envoy.Service.Status.V3.ClientStatusDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Status.V3.ClientStatusDiscoveryService.Service
end

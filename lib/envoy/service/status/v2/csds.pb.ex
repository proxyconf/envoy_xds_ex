defmodule Envoy.Service.Status.V2.ConfigStatus do
  @moduledoc """
  Status of a config.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNKNOWN, 0
  field :SYNCED, 1
  field :NOT_SENT, 2
  field :STALE, 3
  field :ERROR, 4
end

defmodule Envoy.Service.Status.V2.ClientStatusRequest do
  @moduledoc """
  Request for client status of clients identified by a list of NodeMatchers.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node_matchers, 1,
    repeated: true,
    type: Envoy.Type.Matcher.NodeMatcher,
    json_name: "nodeMatchers"
end

defmodule Envoy.Service.Status.V2.PerXdsConfig do
  @moduledoc """
  Detailed config (per xDS) with status.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :per_xds_config, 0

  field :status, 1, type: Envoy.Service.Status.V2.ConfigStatus, enum: true

  field :listener_config, 2,
    type: Envoy.Admin.V2alpha.ListenersConfigDump,
    json_name: "listenerConfig",
    oneof: 0

  field :cluster_config, 3,
    type: Envoy.Admin.V2alpha.ClustersConfigDump,
    json_name: "clusterConfig",
    oneof: 0

  field :route_config, 4,
    type: Envoy.Admin.V2alpha.RoutesConfigDump,
    json_name: "routeConfig",
    oneof: 0

  field :scoped_route_config, 5,
    type: Envoy.Admin.V2alpha.ScopedRoutesConfigDump,
    json_name: "scopedRouteConfig",
    oneof: 0
end

defmodule Envoy.Service.Status.V2.ClientConfig do
  @moduledoc """
  All xds configs for a particular client.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node, 1, type: Envoy.Api.V2.Core.Node

  field :xds_config, 2,
    repeated: true,
    type: Envoy.Service.Status.V2.PerXdsConfig,
    json_name: "xdsConfig"
end

defmodule Envoy.Service.Status.V2.ClientStatusResponse do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :config, 1, repeated: true, type: Envoy.Service.Status.V2.ClientConfig
end

defmodule Envoy.Service.Status.V2.ClientStatusDiscoveryService.Service do
  @moduledoc """
  CSDS is Client Status Discovery Service. It can be used to get the status of
  an xDS-compliant client from the management server's point of view. In the
  future, it can potentially be used as an interface to get the current
  state directly from the client.
  [#protodoc-title: Client Status Discovery Service (CSDS)]
  """

  use GRPC.Service,
    name: "envoy.service.status.v2.ClientStatusDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamClientStatus,
      stream(Envoy.Service.Status.V2.ClientStatusRequest),
      stream(Envoy.Service.Status.V2.ClientStatusResponse)

  rpc :FetchClientStatus,
      Envoy.Service.Status.V2.ClientStatusRequest,
      Envoy.Service.Status.V2.ClientStatusResponse
end

defmodule Envoy.Service.Status.V2.ClientStatusDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Status.V2.ClientStatusDiscoveryService.Service
end

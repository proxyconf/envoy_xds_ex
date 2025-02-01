defmodule Envoy.Api.V2.DiscoveryRequest do
  @moduledoc """
  A DiscoveryRequest requests a set of versioned resources of the same type for
  a given Envoy node on some API.
  [#next-free-field: 7]
  [#protodoc-title: Common discovery API components]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :node, 2, type: Envoy.Api.V2.Core.Node
  field :resource_names, 3, repeated: true, type: :string, json_name: "resourceNames"
  field :type_url, 4, type: :string, json_name: "typeUrl"
  field :response_nonce, 5, type: :string, json_name: "responseNonce"
  field :error_detail, 6, type: Google.Rpc.Status, json_name: "errorDetail"
end

defmodule Envoy.Api.V2.DiscoveryResponse do
  @moduledoc """
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :resources, 2, repeated: true, type: Google.Protobuf.Any
  field :canary, 3, type: :bool
  field :type_url, 4, type: :string, json_name: "typeUrl"
  field :nonce, 5, type: :string
  field :control_plane, 6, type: Envoy.Api.V2.Core.ControlPlane, json_name: "controlPlane"
end

defmodule Envoy.Api.V2.DeltaDiscoveryRequest.InitialResourceVersionsEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Api.V2.DeltaDiscoveryRequest do
  @moduledoc """
  DeltaDiscoveryRequest and DeltaDiscoveryResponse are used in a new gRPC
  endpoint for Delta xDS.

  With Delta xDS, the DeltaDiscoveryResponses do not need to include a full
  snapshot of the tracked resources. Instead, DeltaDiscoveryResponses are a
  diff to the state of a xDS client.
  In Delta XDS there are per-resource versions, which allow tracking state at
  the resource granularity.
  An xDS Delta session is always in the context of a gRPC bidirectional
  stream. This allows the xDS server to keep track of the state of xDS clients
  connected to it.

  In Delta xDS the nonce field is required and used to pair
  DeltaDiscoveryResponse to a DeltaDiscoveryRequest ACK or NACK.
  Optionally, a response message level system_version_info is present for
  debugging purposes only.

  DeltaDiscoveryRequest plays two independent roles. Any DeltaDiscoveryRequest
  can be either or both of: [1] informing the server of what resources the
  client has gained/lost interest in (using resource_names_subscribe and
  resource_names_unsubscribe), or [2] (N)ACKing an earlier resource update from
  the server (using response_nonce, with presence of error_detail making it a NACK).
  Additionally, the first message (for a given type_url) of a reconnected gRPC stream
  has a third role: informing the server of the resources (and their versions)
  that the client already possesses, using the initial_resource_versions field.

  As with state-of-the-world, when multiple resource types are multiplexed (ADS),
  all requests/acknowledgments/updates are logically walled off by type_url:
  a Cluster ACK exists in a completely separate world from a prior Route NACK.
  In particular, initial_resource_versions being sent at the "start" of every
  gRPC stream actually entails a message for each type_url, each with its own
  initial_resource_versions.
  [#next-free-field: 8]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node, 1, type: Envoy.Api.V2.Core.Node
  field :type_url, 2, type: :string, json_name: "typeUrl"

  field :resource_names_subscribe, 3,
    repeated: true,
    type: :string,
    json_name: "resourceNamesSubscribe"

  field :resource_names_unsubscribe, 4,
    repeated: true,
    type: :string,
    json_name: "resourceNamesUnsubscribe"

  field :initial_resource_versions, 5,
    repeated: true,
    type: Envoy.Api.V2.DeltaDiscoveryRequest.InitialResourceVersionsEntry,
    json_name: "initialResourceVersions",
    map: true

  field :response_nonce, 6, type: :string, json_name: "responseNonce"
  field :error_detail, 7, type: Google.Rpc.Status, json_name: "errorDetail"
end

defmodule Envoy.Api.V2.DeltaDiscoveryResponse do
  @moduledoc """
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :system_version_info, 1, type: :string, json_name: "systemVersionInfo"
  field :resources, 2, repeated: true, type: Envoy.Api.V2.Resource
  field :type_url, 4, type: :string, json_name: "typeUrl"
  field :removed_resources, 6, repeated: true, type: :string, json_name: "removedResources"
  field :nonce, 5, type: :string
end

defmodule Envoy.Api.V2.Resource do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 3, type: :string
  field :aliases, 4, repeated: true, type: :string
  field :version, 1, type: :string
  field :resource, 2, type: Google.Protobuf.Any
end

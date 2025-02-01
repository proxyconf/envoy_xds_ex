defmodule Envoy.Service.Discovery.V3.ResourceLocator.DynamicParametersEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Service.Discovery.V3.ResourceLocator do
  @moduledoc """
  Specifies a resource to be subscribed to.
  [#protodoc-title: Common discovery API components]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string

  field :dynamic_parameters, 2,
    repeated: true,
    type: Envoy.Service.Discovery.V3.ResourceLocator.DynamicParametersEntry,
    json_name: "dynamicParameters",
    map: true
end

defmodule Envoy.Service.Discovery.V3.ResourceName do
  @moduledoc """
  Specifies a concrete resource name.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string

  field :dynamic_parameter_constraints, 2,
    type: Envoy.Service.Discovery.V3.DynamicParameterConstraints,
    json_name: "dynamicParameterConstraints"
end

defmodule Envoy.Service.Discovery.V3.ResourceError do
  @moduledoc """
  [#not-implemented-hide:]
  An error associated with a specific resource name, returned to the
  client by the server.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :resource_name, 1,
    type: Envoy.Service.Discovery.V3.ResourceName,
    json_name: "resourceName"

  field :error_detail, 2, type: Google.Rpc.Status, json_name: "errorDetail"
end

defmodule Envoy.Service.Discovery.V3.DiscoveryRequest do
  @moduledoc """
  A DiscoveryRequest requests a set of versioned resources of the same type for
  a given Envoy node on some API.
  [#next-free-field: 8]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :node, 2, type: Envoy.Config.Core.V3.Node
  field :resource_names, 3, repeated: true, type: :string, json_name: "resourceNames"

  field :resource_locators, 7,
    repeated: true,
    type: Envoy.Service.Discovery.V3.ResourceLocator,
    json_name: "resourceLocators"

  field :type_url, 4, type: :string, json_name: "typeUrl"
  field :response_nonce, 5, type: :string, json_name: "responseNonce"
  field :error_detail, 6, type: Google.Rpc.Status, json_name: "errorDetail"
end

defmodule Envoy.Service.Discovery.V3.DiscoveryResponse do
  @moduledoc """
  [#next-free-field: 8]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version_info, 1, type: :string, json_name: "versionInfo"
  field :resources, 2, repeated: true, type: Google.Protobuf.Any
  field :canary, 3, type: :bool
  field :type_url, 4, type: :string, json_name: "typeUrl"
  field :nonce, 5, type: :string
  field :control_plane, 6, type: Envoy.Config.Core.V3.ControlPlane, json_name: "controlPlane"

  field :resource_errors, 7,
    repeated: true,
    type: Envoy.Service.Discovery.V3.ResourceError,
    json_name: "resourceErrors"
end

defmodule Envoy.Service.Discovery.V3.DeltaDiscoveryRequest.InitialResourceVersionsEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Service.Discovery.V3.DeltaDiscoveryRequest do
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
  [#next-free-field: 10]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node, 1, type: Envoy.Config.Core.V3.Node
  field :type_url, 2, type: :string, json_name: "typeUrl"

  field :resource_names_subscribe, 3,
    repeated: true,
    type: :string,
    json_name: "resourceNamesSubscribe"

  field :resource_names_unsubscribe, 4,
    repeated: true,
    type: :string,
    json_name: "resourceNamesUnsubscribe"

  field :resource_locators_subscribe, 8,
    repeated: true,
    type: Envoy.Service.Discovery.V3.ResourceLocator,
    json_name: "resourceLocatorsSubscribe"

  field :resource_locators_unsubscribe, 9,
    repeated: true,
    type: Envoy.Service.Discovery.V3.ResourceLocator,
    json_name: "resourceLocatorsUnsubscribe"

  field :initial_resource_versions, 5,
    repeated: true,
    type: Envoy.Service.Discovery.V3.DeltaDiscoveryRequest.InitialResourceVersionsEntry,
    json_name: "initialResourceVersions",
    map: true

  field :response_nonce, 6, type: :string, json_name: "responseNonce"
  field :error_detail, 7, type: Google.Rpc.Status, json_name: "errorDetail"
end

defmodule Envoy.Service.Discovery.V3.DeltaDiscoveryResponse do
  @moduledoc """
  [#next-free-field: 10]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :system_version_info, 1, type: :string, json_name: "systemVersionInfo"
  field :resources, 2, repeated: true, type: Envoy.Service.Discovery.V3.Resource
  field :type_url, 4, type: :string, json_name: "typeUrl"
  field :removed_resources, 6, repeated: true, type: :string, json_name: "removedResources"

  field :removed_resource_names, 8,
    repeated: true,
    type: Envoy.Service.Discovery.V3.ResourceName,
    json_name: "removedResourceNames"

  field :nonce, 5, type: :string
  field :control_plane, 7, type: Envoy.Config.Core.V3.ControlPlane, json_name: "controlPlane"

  field :resource_errors, 9,
    repeated: true,
    type: Envoy.Service.Discovery.V3.ResourceError,
    json_name: "resourceErrors"
end

defmodule Envoy.Service.Discovery.V3.DynamicParameterConstraints.SingleConstraint.Exists do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.Discovery.V3.DynamicParameterConstraints.SingleConstraint do
  @moduledoc """
  A single constraint for a given key.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :constraint_type, 0

  field :key, 1, type: :string
  field :value, 2, type: :string, oneof: 0

  field :exists, 3,
    type: Envoy.Service.Discovery.V3.DynamicParameterConstraints.SingleConstraint.Exists,
    oneof: 0
end

defmodule Envoy.Service.Discovery.V3.DynamicParameterConstraints.ConstraintList do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :constraints, 1,
    repeated: true,
    type: Envoy.Service.Discovery.V3.DynamicParameterConstraints
end

defmodule Envoy.Service.Discovery.V3.DynamicParameterConstraints do
  @moduledoc """
  A set of dynamic parameter constraints associated with a variant of an individual xDS resource.
  These constraints determine whether the resource matches a subscription based on the set of
  dynamic parameters in the subscription, as specified in the
  :ref:`ResourceLocator.dynamic_parameters<envoy_v3_api_field_service.discovery.v3.ResourceLocator.dynamic_parameters>`
  field. This allows xDS implementations (clients, servers, and caching proxies) to determine
  which variant of a resource is appropriate for a given client.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :type, 0

  field :constraint, 1,
    type: Envoy.Service.Discovery.V3.DynamicParameterConstraints.SingleConstraint,
    oneof: 0

  field :or_constraints, 2,
    type: Envoy.Service.Discovery.V3.DynamicParameterConstraints.ConstraintList,
    json_name: "orConstraints",
    oneof: 0

  field :and_constraints, 3,
    type: Envoy.Service.Discovery.V3.DynamicParameterConstraints.ConstraintList,
    json_name: "andConstraints",
    oneof: 0

  field :not_constraints, 4,
    type: Envoy.Service.Discovery.V3.DynamicParameterConstraints,
    json_name: "notConstraints",
    oneof: 0
end

defmodule Envoy.Service.Discovery.V3.Resource.CacheControl do
  @moduledoc """
  Cache control properties for the resource.
  [#not-implemented-hide:]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :do_not_cache, 1, type: :bool, json_name: "doNotCache"
end

defmodule Envoy.Service.Discovery.V3.Resource do
  @moduledoc """
  [#next-free-field: 10]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 3, type: :string

  field :resource_name, 8,
    type: Envoy.Service.Discovery.V3.ResourceName,
    json_name: "resourceName"

  field :aliases, 4, repeated: true, type: :string
  field :version, 1, type: :string
  field :resource, 2, type: Google.Protobuf.Any
  field :ttl, 6, type: Google.Protobuf.Duration

  field :cache_control, 7,
    type: Envoy.Service.Discovery.V3.Resource.CacheControl,
    json_name: "cacheControl"

  field :metadata, 9, type: Envoy.Config.Core.V3.Metadata
end

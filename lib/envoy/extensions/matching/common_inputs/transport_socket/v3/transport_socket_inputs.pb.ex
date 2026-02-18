defmodule Envoy.Extensions.Matching.CommonInputs.TransportSocket.V3.EndpointMetadataInput.PathSegment do
  @moduledoc """
  Specifies the segment in a path to retrieve value from Metadata.
  Note: Currently it's not supported to retrieve a value from a list in Metadata. This means that
  if the segment key refers to a list, it has to be the last segment in a path.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.matching.common_inputs.transport_socket.v3.EndpointMetadataInput.PathSegment",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :segment, 0

  field :key, 1, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Extensions.Matching.CommonInputs.TransportSocket.V3.EndpointMetadataInput do
  @moduledoc """
  Specifies that matching should be performed by the endpoint metadata.
  This input extracts metadata from the selected endpoint for transport socket selection.
  The metadata is extracted using a filter and path specification similar to
  :ref:`DynamicMetadataInput <envoy_v3_api_msg_extensions.matching.common_inputs.network.v3.DynamicMetadataInput>`.

  Example: Extract a metadata value for transport socket matching.

  .. code-block:: yaml

    typed_config:
      "@type": type.googleapis.com/envoy.extensions.matching.common_inputs.transport_socket.v3.EndpointMetadataInput
      filter: "envoy.transport_socket_match"
      path:
        - key: "socket_type"

  This configuration extracts the value at path ``["envoy.transport_socket_match"]["socket_type"]``
  from the endpoint metadata for use in transport socket selection.

  [#extension: envoy.matching.inputs.endpoint_metadata]
  [#protodoc-title: Transport Socket Matching Inputs]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.matching.common_inputs.transport_socket.v3.EndpointMetadataInput",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :filter, 1, type: :string

  field :path, 2,
    repeated: true,
    type:
      Envoy.Extensions.Matching.CommonInputs.TransportSocket.V3.EndpointMetadataInput.PathSegment,
    deprecated: false
end

defmodule Envoy.Extensions.Matching.CommonInputs.TransportSocket.V3.LocalityMetadataInput.PathSegment do
  @moduledoc """
  Specifies the segment in a path to retrieve value from Metadata.
  Note: Currently it's not supported to retrieve a value from a list in Metadata. This means that
  if the segment key refers to a list, it has to be the last segment in a path.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.matching.common_inputs.transport_socket.v3.LocalityMetadataInput.PathSegment",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :segment, 0

  field :key, 1, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Extensions.Matching.CommonInputs.TransportSocket.V3.LocalityMetadataInput do
  @moduledoc """
  Specifies that matching should be performed by the locality metadata.
  This input extracts metadata from the endpoint's locality for transport socket selection.
  The metadata is extracted using a filter and path specification similar to
  :ref:`DynamicMetadataInput <envoy_v3_api_msg_extensions.matching.common_inputs.network.v3.DynamicMetadataInput>`.

  Example: Extract a metadata value from locality for transport socket matching.

  .. code-block:: yaml

    typed_config:
      "@type": type.googleapis.com/envoy.extensions.matching.common_inputs.transport_socket.v3.LocalityMetadataInput
      filter: "envoy.transport_socket_match"
      path:
        - key: "region"

  This configuration extracts the value at path ``["envoy.transport_socket_match"]["region"]``
  from the locality metadata for use in transport socket selection.

  [#extension: envoy.matching.inputs.locality_metadata]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.matching.common_inputs.transport_socket.v3.LocalityMetadataInput",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :filter, 1, type: :string

  field :path, 2,
    repeated: true,
    type:
      Envoy.Extensions.Matching.CommonInputs.TransportSocket.V3.LocalityMetadataInput.PathSegment,
    deprecated: false
end

defmodule Envoy.Extensions.Matching.CommonInputs.TransportSocket.V3.FilterStateInput do
  @moduledoc """
  Specifies that matching should be performed by filter state.
  This input extracts a value from filter state that was explicitly shared from the
  downstream connection to the upstream connection via ``TransportSocketOptions``.
  This enables flexible downstream-connection-based transport socket selection,
  such as matching on network namespace or any custom filter state data.

  Example: Match on network namespace stored in filter state.

  .. code-block:: yaml

    typed_config:
      "@type": type.googleapis.com/envoy.extensions.matching.common_inputs.transport_socket.v3.FilterStateInput
      key: "envoy.network.namespace"

  [#extension: envoy.matching.inputs.transport_socket_filter_state]
  """

  use Protobuf,
    full_name: "envoy.extensions.matching.common_inputs.transport_socket.v3.FilterStateInput",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Matching.CommonInputs.TransportSocket.V3.TransportSocketNameAction do
  @moduledoc """
  Configuration for the transport socket name action.
  This action sets the name of the transport socket to use when the matcher matches.
  [#extension: envoy.matching.action.transport_socket.name]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.matching.common_inputs.transport_socket.v3.TransportSocketNameAction",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
end

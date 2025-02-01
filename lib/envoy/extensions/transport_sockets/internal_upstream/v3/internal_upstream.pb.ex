defmodule Envoy.Extensions.TransportSockets.InternalUpstream.V3.InternalUpstreamTransport.MetadataValueSource do
  @moduledoc """
  Describes the location of the imported metadata value.
  If the metadata with the given name is not present at the source location,
  then no metadata is passed through for this particular instance.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :kind, 1, type: Envoy.Type.Metadata.V3.MetadataKind, deprecated: false
  field :name, 2, type: :string, deprecated: false
end

defmodule Envoy.Extensions.TransportSockets.InternalUpstream.V3.InternalUpstreamTransport do
  @moduledoc """
  Configuration for the internal upstream address. An internal address defines
  a loopback user space socket residing in the same proxy instance. This
  extension allows passing additional structured state across the user space
  socket in addition to the regular byte stream. The purpose is to facilitate
  communication between filters on the downstream and the upstream internal
  connections. All filter state objects that are shared with the upstream
  connection are also shared with the downstream internal connection using
  this transport socket.
  [#protodoc-title: Internal Upstream]
  [#extension: envoy.transport_sockets.internal_upstream]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :passthrough_metadata, 1,
    repeated: true,
    type:
      Envoy.Extensions.TransportSockets.InternalUpstream.V3.InternalUpstreamTransport.MetadataValueSource,
    json_name: "passthroughMetadata"

  field :transport_socket, 3,
    type: Envoy.Config.Core.V3.TransportSocket,
    json_name: "transportSocket",
    deprecated: false
end

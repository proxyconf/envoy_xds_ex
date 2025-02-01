defmodule Envoy.Type.Metadata.V3.MetadataKey.PathSegment do
  @moduledoc """
  Specifies the segment in a path to retrieve value from Metadata.
  Currently it is only supported to specify the key, i.e. field name, as one segment of a path.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :segment, 0

  field :key, 1, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Type.Metadata.V3.MetadataKey do
  @moduledoc """
  MetadataKey provides a general interface using ``key`` and ``path`` to retrieve value from
  :ref:`Metadata <envoy_v3_api_msg_config.core.v3.Metadata>`.

  For example, for the following Metadata:

  .. code-block:: yaml

  filter_metadata:
  envoy.xxx:
  prop:
  foo: bar
  xyz:
  hello: envoy

  The following MetadataKey will retrieve a string value "bar" from the Metadata.

  .. code-block:: yaml

  key: envoy.xxx
  path:
  - key: prop
  - key: foo
  [#protodoc-title: Metadata]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string, deprecated: false

  field :path, 2,
    repeated: true,
    type: Envoy.Type.Metadata.V3.MetadataKey.PathSegment,
    deprecated: false
end

defmodule Envoy.Type.Metadata.V3.MetadataKind.Request do
  @moduledoc """
  Represents dynamic metadata associated with the request.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Type.Metadata.V3.MetadataKind.Route do
  @moduledoc """
  Represents metadata from :ref:`the route<envoy_v3_api_field_config.route.v3.Route.metadata>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Type.Metadata.V3.MetadataKind.Cluster do
  @moduledoc """
  Represents metadata from :ref:`the upstream cluster<envoy_v3_api_field_config.cluster.v3.Cluster.metadata>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Type.Metadata.V3.MetadataKind.Host do
  @moduledoc """
  Represents metadata from :ref:`the upstream
  host<envoy_v3_api_field_config.endpoint.v3.LbEndpoint.metadata>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Type.Metadata.V3.MetadataKind do
  @moduledoc """
  Describes what kind of metadata.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :kind, 0

  field :request, 1, type: Envoy.Type.Metadata.V3.MetadataKind.Request, oneof: 0
  field :route, 2, type: Envoy.Type.Metadata.V3.MetadataKind.Route, oneof: 0
  field :cluster, 3, type: Envoy.Type.Metadata.V3.MetadataKind.Cluster, oneof: 0
  field :host, 4, type: Envoy.Type.Metadata.V3.MetadataKind.Host, oneof: 0
end

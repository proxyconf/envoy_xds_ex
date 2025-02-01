defmodule Envoy.Type.Tracing.V2.CustomTag.Literal do
  @moduledoc """
  Literal type custom tag with static value for the tag value.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :value, 1, type: :string, deprecated: false
end

defmodule Envoy.Type.Tracing.V2.CustomTag.Environment do
  @moduledoc """
  Environment type custom tag with environment name and default value.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :default_value, 2, type: :string, json_name: "defaultValue"
end

defmodule Envoy.Type.Tracing.V2.CustomTag.Header do
  @moduledoc """
  Header type custom tag with header name and default value.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :default_value, 2, type: :string, json_name: "defaultValue"
end

defmodule Envoy.Type.Tracing.V2.CustomTag.Metadata do
  @moduledoc """
  Metadata type custom tag using
  :ref:`MetadataKey <envoy_api_msg_type.metadata.v2.MetadataKey>` to retrieve the protobuf value
  from :ref:`Metadata <envoy_api_msg_core.Metadata>`, and populate the tag value with
  `the canonical JSON <https://developers.google.com/protocol-buffers/docs/proto3#json>`_
  representation of it.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :kind, 1, type: Envoy.Type.Metadata.V2.MetadataKind
  field :metadata_key, 2, type: Envoy.Type.Metadata.V2.MetadataKey, json_name: "metadataKey"
  field :default_value, 3, type: :string, json_name: "defaultValue"
end

defmodule Envoy.Type.Tracing.V2.CustomTag do
  @moduledoc """
  Describes custom tags for the active span.
  [#next-free-field: 6]
  [#protodoc-title: Custom Tag]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :type, 0

  field :tag, 1, type: :string, deprecated: false
  field :literal, 2, type: Envoy.Type.Tracing.V2.CustomTag.Literal, oneof: 0
  field :environment, 3, type: Envoy.Type.Tracing.V2.CustomTag.Environment, oneof: 0

  field :request_header, 4,
    type: Envoy.Type.Tracing.V2.CustomTag.Header,
    json_name: "requestHeader",
    oneof: 0

  field :metadata, 5, type: Envoy.Type.Tracing.V2.CustomTag.Metadata, oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.Field do
  @moduledoc """
  [#protodoc-title: Thrift-To-Metadata Filter]

  The Thrift to Metadata filter serves for thrift over HTTP traffic, expecting serialized
  Thrift request and response bodies in the HTTP payload. It extracts *thrift metadata* from the
  HTTP body and put them into the *filter metadata*. This is useful for matching load balancer
  subsets, logging, etc.

  Thrift to Metadata :ref:`configuration overview <config_http_filters_thrift_to_metadata>`.
  [#extension: envoy.filters.http.thrift_to_metadata]
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :METHOD_NAME, 0
  field :PROTOCOL, 1
  field :TRANSPORT, 2
  field :HEADER_FLAGS, 3
  field :SEQUENCE_ID, 4
  field :MESSAGE_TYPE, 5
  field :REPLY_TYPE, 6
end

defmodule Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.KeyValuePair do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :metadata_namespace, 1, type: :string, json_name: "metadataNamespace"
  field :key, 2, type: :string, deprecated: false
  field :value, 3, type: Google.Protobuf.Value
end

defmodule Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.FieldSelector do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :id, 2, type: :int32, deprecated: false
  field :child, 3, type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.FieldSelector
end

defmodule Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.Rule do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :field, 1, type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.Field, enum: true

  field :field_selector, 2,
    type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.FieldSelector,
    json_name: "fieldSelector",
    deprecated: false

  field :method_name, 3, type: :string, json_name: "methodName", deprecated: false

  field :on_present, 4,
    type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.KeyValuePair,
    json_name: "onPresent"

  field :on_missing, 5,
    type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.KeyValuePair,
    json_name: "onMissing"
end

defmodule Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.ThriftToMetadata do
  @moduledoc """
  The configuration for transforming thrift metadata into filter metadata.

  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :request_rules, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.Rule,
    json_name: "requestRules"

  field :response_rules, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.Rule,
    json_name: "responseRules"

  field :transport, 3,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.TransportType,
    enum: true,
    deprecated: false

  field :protocol, 4,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.ProtocolType,
    enum: true,
    deprecated: false

  field :allow_content_types, 5,
    repeated: true,
    type: :string,
    json_name: "allowContentTypes",
    deprecated: false

  field :allow_empty_content_type, 6, type: :bool, json_name: "allowEmptyContentType"
end

defmodule Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.ThriftToMetadataPerRoute do
  @moduledoc """
  Thrift to metadata configuration on a per-route basis, which overrides the global configuration for
  request rules and responses rules.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :request_rules, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.Rule,
    json_name: "requestRules"

  field :response_rules, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ThriftToMetadata.V3.Rule,
    json_name: "responseRules"
end

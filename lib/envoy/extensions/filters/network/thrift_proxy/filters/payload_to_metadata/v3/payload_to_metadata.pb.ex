defmodule Envoy.Extensions.Filters.Network.ThriftProxy.Filters.PayloadToMetadata.V3.PayloadToMetadata.ValueType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :STRING, 0
  field :NUMBER, 1
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.Filters.PayloadToMetadata.V3.PayloadToMetadata.KeyValuePair do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :value_type, 0

  field :metadata_namespace, 1, type: :string, json_name: "metadataNamespace"
  field :key, 2, type: :string, deprecated: false
  field :value, 3, type: :string, oneof: 0

  field :regex_value_rewrite, 4,
    type: Envoy.Type.Matcher.V3.RegexMatchAndSubstitute,
    json_name: "regexValueRewrite",
    oneof: 0

  field :type, 5,
    type:
      Envoy.Extensions.Filters.Network.ThriftProxy.Filters.PayloadToMetadata.V3.PayloadToMetadata.ValueType,
    enum: true,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.Filters.PayloadToMetadata.V3.PayloadToMetadata.Rule do
  @moduledoc """
  A Rule defines what metadata to apply when a field is present or missing.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :match_specifier, 0

  field :method_name, 1, type: :string, json_name: "methodName", oneof: 0
  field :service_name, 2, type: :string, json_name: "serviceName", oneof: 0

  field :field_selector, 3,
    type:
      Envoy.Extensions.Filters.Network.ThriftProxy.Filters.PayloadToMetadata.V3.PayloadToMetadata.FieldSelector,
    json_name: "fieldSelector",
    deprecated: false

  field :on_present, 4,
    type:
      Envoy.Extensions.Filters.Network.ThriftProxy.Filters.PayloadToMetadata.V3.PayloadToMetadata.KeyValuePair,
    json_name: "onPresent"

  field :on_missing, 5,
    type:
      Envoy.Extensions.Filters.Network.ThriftProxy.Filters.PayloadToMetadata.V3.PayloadToMetadata.KeyValuePair,
    json_name: "onMissing"
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.Filters.PayloadToMetadata.V3.PayloadToMetadata.FieldSelector do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :id, 2, type: :int32, deprecated: false

  field :child, 3,
    type:
      Envoy.Extensions.Filters.Network.ThriftProxy.Filters.PayloadToMetadata.V3.PayloadToMetadata.FieldSelector
end

defmodule Envoy.Extensions.Filters.Network.ThriftProxy.Filters.PayloadToMetadata.V3.PayloadToMetadata do
  @moduledoc """
  [#protodoc-title: Payload-To-Metadata Filter]

  The configuration for transforming payloads into metadata. This is useful
  for matching load balancer subsets, logging, etc.

  Payload to Metadata :ref:`configuration overview <config_thrift_filters_payload_to_metadata>`.
  [#extension: envoy.filters.thrift.payload_to_metadata]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :request_rules, 1,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Network.ThriftProxy.Filters.PayloadToMetadata.V3.PayloadToMetadata.Rule,
    json_name: "requestRules",
    deprecated: false
end

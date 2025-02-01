defmodule Envoy.Config.Filter.Http.HeaderToMetadata.V2.Config.ValueType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :STRING, 0
  field :NUMBER, 1
  field :PROTOBUF_VALUE, 2
end

defmodule Envoy.Config.Filter.Http.HeaderToMetadata.V2.Config.ValueEncode do
  @moduledoc """
  ValueEncode defines the encoding algorithm.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :NONE, 0
  field :BASE64, 1
end

defmodule Envoy.Config.Filter.Http.HeaderToMetadata.V2.Config.KeyValuePair do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :metadata_namespace, 1, type: :string, json_name: "metadataNamespace"
  field :key, 2, type: :string, deprecated: false
  field :value, 3, type: :string
  field :type, 4, type: Envoy.Config.Filter.Http.HeaderToMetadata.V2.Config.ValueType, enum: true

  field :encode, 5,
    type: Envoy.Config.Filter.Http.HeaderToMetadata.V2.Config.ValueEncode,
    enum: true
end

defmodule Envoy.Config.Filter.Http.HeaderToMetadata.V2.Config.Rule do
  @moduledoc """
  A Rule defines what metadata to apply when a header is present or missing.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :header, 1, type: :string, deprecated: false

  field :on_header_present, 2,
    type: Envoy.Config.Filter.Http.HeaderToMetadata.V2.Config.KeyValuePair,
    json_name: "onHeaderPresent"

  field :on_header_missing, 3,
    type: Envoy.Config.Filter.Http.HeaderToMetadata.V2.Config.KeyValuePair,
    json_name: "onHeaderMissing"

  field :remove, 4, type: :bool
end

defmodule Envoy.Config.Filter.Http.HeaderToMetadata.V2.Config do
  @moduledoc """
  [#protodoc-title: Header-To-Metadata Filter]

  The configuration for transforming headers into metadata. This is useful
  for matching load balancer subsets, logging, etc.

  Header to Metadata :ref:`configuration overview <config_http_filters_header_to_metadata>`.
  [#extension: envoy.filters.http.header_to_metadata]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :request_rules, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.HeaderToMetadata.V2.Config.Rule,
    json_name: "requestRules"

  field :response_rules, 2,
    repeated: true,
    type: Envoy.Config.Filter.Http.HeaderToMetadata.V2.Config.Rule,
    json_name: "responseRules"
end

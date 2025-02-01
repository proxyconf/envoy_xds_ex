defmodule Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.ValueType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :STRING, 0
  field :NUMBER, 1
  field :PROTOBUF_VALUE, 2
end

defmodule Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.ValueEncode do
  @moduledoc """
  ValueEncode defines the encoding algorithm.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :NONE, 0
  field :BASE64, 1
end

defmodule Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.KeyValuePair do
  @moduledoc """
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :metadata_namespace, 1, type: :string, json_name: "metadataNamespace"
  field :key, 2, type: :string, deprecated: false
  field :value, 3, type: :string, deprecated: false

  field :regex_value_rewrite, 6,
    type: Envoy.Type.Matcher.V3.RegexMatchAndSubstitute,
    json_name: "regexValueRewrite",
    deprecated: false

  field :type, 4,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.ValueType,
    enum: true,
    deprecated: false

  field :encode, 5,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.ValueEncode,
    enum: true
end

defmodule Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.Rule do
  @moduledoc """
  A Rule defines what metadata to apply when a header is present or missing.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :header, 1, type: :string, deprecated: false
  field :cookie, 5, type: :string, deprecated: false

  field :on_header_present, 2,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.KeyValuePair,
    json_name: "onHeaderPresent",
    deprecated: false

  field :on_header_missing, 3,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.KeyValuePair,
    json_name: "onHeaderMissing",
    deprecated: false

  field :remove, 4, type: :bool
end

defmodule Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config do
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
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.Rule,
    json_name: "requestRules"

  field :response_rules, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.HeaderToMetadata.V3.Config.Rule,
    json_name: "responseRules"
end

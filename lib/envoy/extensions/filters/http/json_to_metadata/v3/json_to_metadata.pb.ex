defmodule Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.ValueType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :PROTOBUF_VALUE, 0
  field :STRING, 1
  field :NUMBER, 2
end

defmodule Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.KeyValuePair do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :value_type, 0

  field :metadata_namespace, 1, type: :string, json_name: "metadataNamespace"
  field :key, 2, type: :string, deprecated: false
  field :value, 3, type: Google.Protobuf.Value, oneof: 0

  field :type, 4,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.ValueType,
    enum: true,
    deprecated: false

  field :preserve_existing_metadata_value, 5,
    type: :bool,
    json_name: "preserveExistingMetadataValue"
end

defmodule Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.Selector do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :selector, 0

  field :key, 1, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.Rule do
  @moduledoc """
  A Rule defines what metadata to apply when a key-value is present, missing in the json
  or fail to parse the payload.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :selectors, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.Selector,
    deprecated: false

  field :on_present, 2,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.KeyValuePair,
    json_name: "onPresent"

  field :on_missing, 3,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.KeyValuePair,
    json_name: "onMissing"

  field :on_error, 4,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.KeyValuePair,
    json_name: "onError"
end

defmodule Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.MatchRules do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :rules, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.Rule,
    deprecated: false

  field :allow_content_types, 2,
    repeated: true,
    type: :string,
    json_name: "allowContentTypes",
    deprecated: false

  field :allow_empty_content_type, 3, type: :bool, json_name: "allowEmptyContentType"

  field :allow_content_types_regex, 4,
    type: Envoy.Type.Matcher.V3.RegexMatcher,
    json_name: "allowContentTypesRegex"
end

defmodule Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata do
  @moduledoc """
  [#protodoc-title: Json-To-Metadata Filter]

  The configuration for transforming json body into metadata. This is useful
  for matching load balancer subsets, logging, etc.

  Json to Metadata :ref:`configuration overview <config_http_filters_json_to_metadata>`.
  [#extension: envoy.filters.http.json_to_metadata]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :request_rules, 1,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.MatchRules,
    json_name: "requestRules"

  field :response_rules, 2,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.MatchRules,
    json_name: "responseRules"
end

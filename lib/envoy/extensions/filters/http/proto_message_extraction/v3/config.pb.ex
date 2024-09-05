defmodule Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.ProtoMessageExtractionConfig.ExtractMode do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :ExtractMode_UNSPECIFIED, 0
  field :FIRST_AND_LAST, 1
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.MethodExtraction.ExtractDirective do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :ExtractDirective_UNSPECIFIED, 0
  field :EXTRACT, 1
  field :EXTRACT_REDACT, 2
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.ProtoMessageExtractionConfig.ExtractionByMethodEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.MethodExtraction
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.ProtoMessageExtractionConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :descriptor_set, 0

  field :data_source, 1, type: Envoy.Config.Core.V3.DataSource, json_name: "dataSource", oneof: 0

  field :proto_descriptor_typed_metadata, 2,
    type: :string,
    json_name: "protoDescriptorTypedMetadata",
    oneof: 0

  field :mode, 3,
    type:
      Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.ProtoMessageExtractionConfig.ExtractMode,
    enum: true

  field :extraction_by_method, 4,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.ProtoMessageExtractionConfig.ExtractionByMethodEntry,
    json_name: "extractionByMethod",
    map: true
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.MethodExtraction.RequestExtractionByFieldEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string

  field :value, 2,
    type:
      Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.MethodExtraction.ExtractDirective,
    enum: true
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.MethodExtraction.ResponseExtractionByFieldEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string

  field :value, 2,
    type:
      Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.MethodExtraction.ExtractDirective,
    enum: true
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.MethodExtraction do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :request_extraction_by_field, 2,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.MethodExtraction.RequestExtractionByFieldEntry,
    json_name: "requestExtractionByField",
    map: true

  field :response_extraction_by_field, 3,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.MethodExtraction.ResponseExtractionByFieldEntry,
    json_name: "responseExtractionByField",
    map: true
end
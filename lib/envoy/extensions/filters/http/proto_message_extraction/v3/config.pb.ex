defmodule Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.ProtoMessageExtractionConfig.ExtractMode do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ExtractMode_UNSPECIFIED, 0
  field :FIRST_AND_LAST, 1
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.MethodExtraction.ExtractDirective do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ExtractDirective_UNSPECIFIED, 0
  field :EXTRACT, 1
  field :EXTRACT_REDACT, 2
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.ProtoMessageExtractionConfig.ExtractionByMethodEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.MethodExtraction
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.ProtoMessageExtractionConfig do
  @moduledoc """
  [#protodoc-title: Proto Message Extraction]

  [#extension: envoy.filters.http.proto_message_extraction]

  Overview
  --------

  ProtoMessageExtraction filter supports extracting gRPC
  requests/responses(proto messages) into google.protobuf.Struct and storing
  results in the dynamic metadata `envoy.filters.http.proto_message_extraction`
  for later access.

  Assumptions
  -----------

  This filter assumes it is only applicable for gRPC with Protobuf as payload.

  Process Flow
  ------------

  On the request path, it will check

  1. if the incoming gRPC request is configured, the filter tries to:

  a. buffer the incoming data to complete protobuf messages
  b. extract individual protobuf messages according to directives
  c. write the result into the dynamic metadata.
  d. pass through the request data

  2. otherwise, pass through the request.

  On the response path, it will check

  1. if the incoming gRPC request is configured, the filter tries to:

  a. buffer the incoming data to complete protobuf messages
  b. extract individual protobuf messages according to directives
  c. write the result into the dynamic metadata.
  d. pass through the response data

  2. otherwise, pass through the response.

  Config Requirements
  -------------------
  Here are config requirements
  1. the extracted target field should be among the following primitive types:
  `string`, `uint32`, `uint64`, `int32`, `int64`, `sint32`, `sint64`,
  `fixed32`, `fixed64`, `sfixed32`, `sfixed64`, `float`, `double`.
  2. the target field could be repeated.
  3. the intermediate type could also be repeated.
  Output Format
  -------------
  The extracted requests and responses will be  will be added in the dynamic
  ``metadata<google.protobuf.Struct>`` with the same layout of the message.
  For the default `FIRST_AND_LAST` mode, it will be like:
  .. code-block:: json
  {
  "requests":{
  "first":{
  "foo": "val_foo1",
  }
  "last":{
  "foo": "val_foo3",
  }
  },
  "responses":{
  "first":{
  "baz": "val_baz1",
  }
  "last":{
  "baz": "val_foo3",
  }
  }
  }
  Example for `FIRST_AND_LAST` mode
  ---------------------------------

  Let's say we have the following definition for the bi-streaming request
  `pkg.svc.Method`.

  .. code-block:: proto

  message MethodRequest {
  string foo = 1;
  Nested nested = 2;
  Msg redacted = 3;
  ...
  }

  message MethodResponse {
  string baz = 1;
  }

  message Nested {
  Msg double_nested = 2;
  }

  message Msg {
  string bar = 1;
  string not_extracted = 2;
  }

  This is the filter config in JSON.

  .. code-block:: json

  {
  "descriptor_set":{},
  "mode": "FIRST_AND_LAST",
  "extraction_by_method":{
  "pkg.svc.Method":{
  "request_extraction_by_field":{
  "foo":"EXTRACT",
  "nested.doubled_nested.bar":"EXTRACT",
  "redacted":"EXTRACT_REDACT"
  },
  "response_extraction_by_field":{
  "bar":"EXTRACT",
  }
  }
  }
  }

  During runtime, the filter receives the following `MethodRequest` message in
  JSON.

  .. code-block:: json

  {
  "foo": "val_foo1",
  "nested": { "double_nested": {"bar": "val_bar1", "not_extracted":
  "val_not_extracted1"}, "redacted": { "bar": "val_redacted_bar1"}
  }
  {
  "foo": "val_foo2",
  "nested": { "double_nested": {"bar": "val_bar2", "not_extracted":
  "val_not_extracted2"}, "redacted": { "bar": "val_redacted_bar2"}
  }
  {
  "foo": "val_foo3",
  "nested": { "double_nested": {"bar": "val_bar3", "not_extracted":
  "val_not_extracted3"}, "redacted": { "bar": "val_redacted_bar3"}
  }

  the filter receives the following `MethodResponse` message in
  JSON.

  .. code-block:: json

  {
  "baz": "val_baz1",
  }
  {
  "baz": "val_baz2",
  }
  {
  "baz": "val_baz3",
  }

  The filter will write the following dynamic
  metadata(`envoy.filters.http.proto_message_extraction`) in JSON.

  .. code-block:: json

  {
  "requests":{
  "first":{
  "foo": "val_foo1",
  "nested": { "double_nested": {"bar": "val_bar1"}},
  "redacted": {}
  }
  "last":{
  "foo": "val_foo3",
  "nested": { "double_nested": {"bar": "val_bar3"}},
  "redacted": {}
  }
  },
  "responses":{
  "first":{
  "baz": "val_baz1"
  }
  "last":{
  "baz": "val_foo3"
  }
  }
  }
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

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
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string

  field :value, 2,
    type:
      Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.MethodExtraction.ExtractDirective,
    enum: true
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.MethodExtraction.ResponseExtractionByFieldEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string

  field :value, 2,
    type:
      Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.MethodExtraction.ExtractDirective,
    enum: true
end

defmodule Envoy.Extensions.Filters.Http.ProtoMessageExtraction.V3.MethodExtraction do
  @moduledoc """
  This message can be used to support per route config approach later even
  though the Istio doesn't support that so far.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

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

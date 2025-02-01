defmodule Envoy.Config.Filter.Http.Compressor.V2.Compressor do
  @moduledoc """
  [#next-free-field: 6]
  [#protodoc-title: Compressor]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :content_length, 1, type: Google.Protobuf.UInt32Value, json_name: "contentLength"
  field :content_type, 2, repeated: true, type: :string, json_name: "contentType"
  field :disable_on_etag_header, 3, type: :bool, json_name: "disableOnEtagHeader"
  field :remove_accept_encoding_header, 4, type: :bool, json_name: "removeAcceptEncodingHeader"

  field :runtime_enabled, 5,
    type: Envoy.Api.V2.Core.RuntimeFeatureFlag,
    json_name: "runtimeEnabled"
end

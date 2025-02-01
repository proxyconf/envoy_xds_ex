defmodule Envoy.Extensions.Http.CustomResponse.LocalResponsePolicy.V3.LocalResponsePolicy do
  @moduledoc """
  Custom response policy to serve a locally stored response to the
  downstream.
  [#protodoc-title: Local Response Policy for Custom Response]
  [#extension: envoy.http.custom_response.local_response_policy]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :body, 1, type: Envoy.Config.Core.V3.DataSource

  field :body_format, 2,
    type: Envoy.Config.Core.V3.SubstitutionFormatString,
    json_name: "bodyFormat"

  field :status_code, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "statusCode",
    deprecated: false

  field :response_headers_to_add, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false
end

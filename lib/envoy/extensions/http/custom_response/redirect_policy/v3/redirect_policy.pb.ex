defmodule Envoy.Extensions.Http.CustomResponse.RedirectPolicy.V3.RedirectPolicy do
  @moduledoc """
  Custom response policy to internally redirect the original response to a different
  upstream.
  [#next-free-field: 7]
  [#protodoc-title: Redirect Policy for Custom Response]
  [#extension: envoy.http.custom_response.redirect_policy]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :redirect_action_specifier, 0

  field :uri, 1, type: :string, oneof: 0, deprecated: false

  field :redirect_action, 2,
    type: Envoy.Config.Route.V3.RedirectAction,
    json_name: "redirectAction",
    oneof: 0

  field :status_code, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "statusCode",
    deprecated: false

  field :response_headers_to_add, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :request_headers_to_add, 5,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "requestHeadersToAdd",
    deprecated: false

  field :modify_request_headers_action, 6,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "modifyRequestHeadersAction"
end

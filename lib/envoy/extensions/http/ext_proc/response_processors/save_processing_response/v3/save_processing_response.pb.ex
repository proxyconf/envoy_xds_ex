defmodule Envoy.Extensions.Http.ExtProc.ResponseProcessors.SaveProcessingResponse.V3.SaveProcessingResponse.SaveOptions do
  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :save_response, 1, type: :bool, json_name: "saveResponse"
  field :save_on_error, 2, type: :bool, json_name: "saveOnError"
end

defmodule Envoy.Extensions.Http.ExtProc.ResponseProcessors.SaveProcessingResponse.V3.SaveProcessingResponse do
  @moduledoc """
  Extension to save the :ref:`response
  <envoy_v3_api_msg_service.ext_proc.v3.ProcessingResponse>` from the external processor as
  filter state with name
  "envoy.http.ext_proc.response_processors.save_processing_response[.:ref:`filter_state_name_suffix
  <envoy_v3_api_field_extensions.http.ext_proc.response_processors.save_processing_response.v3.SaveProcessingResponse.filter_state_name>`].
  This extension supports saving of request and response headers and trailers,
  and immediate response.

  .. note::
  Response processors are currently in alpha.

  [#next-free-field: 7]
  [#protodoc-title: Save Processing Response from external processor.]
  [#extension: envoy.http.ext_proc.response_processors.save_processing_response]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :filter_state_name_suffix, 1, type: :string, json_name: "filterStateNameSuffix"

  field :save_request_headers, 2,
    type:
      Envoy.Extensions.Http.ExtProc.ResponseProcessors.SaveProcessingResponse.V3.SaveProcessingResponse.SaveOptions,
    json_name: "saveRequestHeaders"

  field :save_response_headers, 3,
    type:
      Envoy.Extensions.Http.ExtProc.ResponseProcessors.SaveProcessingResponse.V3.SaveProcessingResponse.SaveOptions,
    json_name: "saveResponseHeaders"

  field :save_request_trailers, 4,
    type:
      Envoy.Extensions.Http.ExtProc.ResponseProcessors.SaveProcessingResponse.V3.SaveProcessingResponse.SaveOptions,
    json_name: "saveRequestTrailers"

  field :save_response_trailers, 5,
    type:
      Envoy.Extensions.Http.ExtProc.ResponseProcessors.SaveProcessingResponse.V3.SaveProcessingResponse.SaveOptions,
    json_name: "saveResponseTrailers"

  field :save_immediate_response, 6,
    type:
      Envoy.Extensions.Http.ExtProc.ResponseProcessors.SaveProcessingResponse.V3.SaveProcessingResponse.SaveOptions,
    json_name: "saveImmediateResponse"
end

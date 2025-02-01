defmodule Envoy.Extensions.Http.OriginalIpDetection.CustomHeader.V3.CustomHeaderConfig do
  @moduledoc """
  This extension allows for the original downstream remote IP to be detected
  by reading the value from a configured header name. If the value is successfully parsed
  as an IP, it'll be treated as the effective downstream remote address and seen as such
  by all filters. See :ref:`original_ip_detection_extensions
  <envoy_v3_api_field_extensions.filters.network.http_connection_manager.v3.HttpConnectionManager.original_ip_detection_extensions>`
  for an overview of how extensions operate and what happens when an extension fails
  to detect the remote IP.

  [#extension: envoy.http.original_ip_detection.custom_header]
  [#protodoc-title: Custom header original IP detection extension]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false

  field :allow_extension_to_set_address_as_trusted, 2,
    type: :bool,
    json_name: "allowExtensionToSetAddressAsTrusted"

  field :reject_with_status, 3, type: Envoy.Type.V3.HttpStatus, json_name: "rejectWithStatus"
end

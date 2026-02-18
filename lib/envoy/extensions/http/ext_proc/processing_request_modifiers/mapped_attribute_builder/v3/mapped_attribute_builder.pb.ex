defmodule Envoy.Extensions.Http.ExtProc.ProcessingRequestModifiers.MappedAttributeBuilder.V3.MappedAttributeBuilder.MappedRequestAttributesEntry do
  use Protobuf,
    full_name:
      "envoy.extensions.http.ext_proc.processing_request_modifiers.mapped_attribute_builder.v3.MappedAttributeBuilder.MappedRequestAttributesEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Extensions.Http.ExtProc.ProcessingRequestModifiers.MappedAttributeBuilder.V3.MappedAttributeBuilder.MappedResponseAttributesEntry do
  use Protobuf,
    full_name:
      "envoy.extensions.http.ext_proc.processing_request_modifiers.mapped_attribute_builder.v3.MappedAttributeBuilder.MappedResponseAttributesEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Extensions.Http.ExtProc.ProcessingRequestModifiers.MappedAttributeBuilder.V3.MappedAttributeBuilder do
  @moduledoc """
  Extension to build custom attributes in the
  :ref:`ProcessingRequest <envoy_v3_api_msg_service.ext_proc.v3.ProcessingRequest>` based on a
  configurable mapping. The native implementation uses the CEL expression as the key, which is
  not always desirable. Using this extension, one can re-map a CEL expression that references
  internal filter state into a more user-friendly key that decouples the value from the underlying
  filter implementation.

  If a given CEL expression fails to evaluate, it will not be present in the attributes struct.

  If this extension is configured, then the original
  :ref:`ProcessingRequest <envoy_v3_api_msg_service.ext_proc.v3.ProcessingRequest>`'s
  ``request_attributes`` are ignored, and all attributes should be explicitly set via this
  extension.

  An example configuration may look like so:

  .. code-block:: yaml

     mapped_request_attributes:
       "request.path": "request.path"
       "source.country": "metadata.filter_metadata['com.example.location_filter']['country_code']"

  In the above example, the complex ``filter_metadata`` expression is evaluated via CEL, and the
  value is stored under the friendlier ``source.country`` key. The
  :ref:`ProcessingRequest <envoy_v3_api_msg_service.ext_proc.v3.ProcessingRequest>` would look
  like:

  .. code-block:: text

     attributes {
       key: "envoy.filters.http.ext_proc"
       value {
         fields {
           key: "request.path"
           value {
             string_value: "/profile"
           }
         }
         fields {
           key: "source.country"
           value {
             string_value: "US"
           }
         }
       }
     }

  .. note::

     Processing request modifiers are currently in alpha.
  [#protodoc-title: Mapped Attribute Builder for the external processor]
  [#extension: envoy.http.ext_proc.processing_request_modifiers.mapped_attribute_builder]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.http.ext_proc.processing_request_modifiers.mapped_attribute_builder.v3.MappedAttributeBuilder",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :mapped_request_attributes, 1,
    repeated: true,
    type:
      Envoy.Extensions.Http.ExtProc.ProcessingRequestModifiers.MappedAttributeBuilder.V3.MappedAttributeBuilder.MappedRequestAttributesEntry,
    json_name: "mappedRequestAttributes",
    map: true

  field :mapped_response_attributes, 2,
    repeated: true,
    type:
      Envoy.Extensions.Http.ExtProc.ProcessingRequestModifiers.MappedAttributeBuilder.V3.MappedAttributeBuilder.MappedResponseAttributesEntry,
    json_name: "mappedResponseAttributes",
    map: true
end

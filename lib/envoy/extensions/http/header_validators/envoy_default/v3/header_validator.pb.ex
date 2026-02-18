defmodule Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig.HeadersWithUnderscoresAction do
  @moduledoc """
  Action to take when Envoy receives client request with header names containing underscore
  characters.

  Underscore character is allowed in header names by RFC-7230, and this behavior is implemented
  as a security measure due to systems that treat ``_`` and ``-`` as interchangeable. Envoy by
  default allows client request headers with underscore characters.

  This setting provides control over how to handle such headers for security and compatibility reasons.
  """

  use Protobuf,
    enum: true,
    full_name:
      "envoy.extensions.http.header_validators.envoy_default.v3.HeaderValidatorConfig.HeadersWithUnderscoresAction",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :ALLOW, 0
  field :REJECT_REQUEST, 1
  field :DROP_HEADER, 2
end

defmodule Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig.UriPathNormalizationOptions.PathWithEscapedSlashesAction do
  @moduledoc """
  Determines the action for requests that contain ``%2F``, ``%2f``, ``%5C`` or ``%5c`` sequences in the URI path.
  This operation occurs before URL normalization and the merge slashes transformations if they were enabled.

  Escaped slash sequences in URLs can be used for path confusion attacks, so proper handling
  is important for security.
  """

  use Protobuf,
    enum: true,
    full_name:
      "envoy.extensions.http.header_validators.envoy_default.v3.HeaderValidatorConfig.UriPathNormalizationOptions.PathWithEscapedSlashesAction",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :IMPLEMENTATION_SPECIFIC_DEFAULT, 0
  field :KEEP_UNCHANGED, 1
  field :REJECT_REQUEST, 2
  field :UNESCAPE_AND_REDIRECT, 3
  field :UNESCAPE_AND_FORWARD, 4
end

defmodule Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig.UriPathNormalizationOptions do
  @moduledoc """
  Configuration options for URI path normalization and transformation.

  These options control how Envoy processes and normalizes incoming request URI paths
  to ensure consistent behavior and security. Path normalization helps prevent
  path traversal attacks and ensures that equivalent paths are handled consistently.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.http.header_validators.envoy_default.v3.HeaderValidatorConfig.UriPathNormalizationOptions",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :skip_path_normalization, 1, type: :bool, json_name: "skipPathNormalization"
  field :skip_merging_slashes, 2, type: :bool, json_name: "skipMergingSlashes"

  field :path_with_escaped_slashes_action, 3,
    type:
      Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig.UriPathNormalizationOptions.PathWithEscapedSlashesAction,
    json_name: "pathWithEscapedSlashesAction",
    enum: true,
    deprecated: false
end

defmodule Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig.Http1ProtocolOptions do
  @moduledoc """
  HTTP/1 protocol specific options for header validation.

  These options control how Envoy handles HTTP/1 specific behaviors and edge cases
  that may not apply to HTTP/2 or HTTP/3 protocols.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.http.header_validators.envoy_default.v3.HeaderValidatorConfig.Http1ProtocolOptions",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :allow_chunked_length, 1, type: :bool, json_name: "allowChunkedLength"
end

defmodule Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig do
  @moduledoc """
  This extension validates that HTTP request and response headers are well formed according to respective RFCs.

  The validator performs comprehensive HTTP header validation including:

  #. HTTP/1 header map validity according to `RFC 7230 section 3.2 <https://datatracker.ietf.org/doc/html/rfc7230#section-3.2>`_.
  #. Syntax of HTTP/1 request target URI and response status.
  #. HTTP/2 header map validity according to `RFC 7540 section 8.1.2 <https://datatracker.ietf.org/doc/html/rfc7540#section-8.1.2>`_.
  #. Syntax of HTTP/2 pseudo headers.
  #. HTTP/3 header map validity according to `RFC 9114 section 4.3  <https://www.rfc-editor.org/rfc/rfc9114.html>`_.
  #. Syntax of HTTP/3 pseudo headers.
  #. Syntax of Content-Length and Transfer-Encoding.
  #. Validation of HTTP/1 requests with both ``Content-Length`` and ``Transfer-Encoding`` headers.
  #. Normalization of the URI path according to `Normalization and Comparison <https://datatracker.ietf.org/doc/html/rfc3986#section-6>`_
     without `case normalization <https://datatracker.ietf.org/doc/html/rfc3986#section-6.2.2.1>`_.

  This validator ensures that HTTP traffic processed by Envoy conforms to established
  standards and helps prevent issues caused by malformed headers or invalid HTTP syntax.

  [#comment:TODO(yanavlasov): Put #extension: envoy.http.header_validators.envoy_default after it is not hidden any more]
  [#next-free-field: 6]
  [#protodoc-title: Envoy's default Header Validator config]
  """

  use Protobuf,
    full_name: "envoy.extensions.http.header_validators.envoy_default.v3.HeaderValidatorConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :http1_protocol_options, 1,
    type:
      Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig.Http1ProtocolOptions,
    json_name: "http1ProtocolOptions"

  field :uri_path_normalization_options, 2,
    type:
      Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig.UriPathNormalizationOptions,
    json_name: "uriPathNormalizationOptions"

  field :restrict_http_methods, 3, type: :bool, json_name: "restrictHttpMethods"

  field :headers_with_underscores_action, 4,
    type:
      Envoy.Extensions.Http.HeaderValidators.EnvoyDefault.V3.HeaderValidatorConfig.HeadersWithUnderscoresAction,
    json_name: "headersWithUnderscoresAction",
    enum: true

  field :strip_fragment_from_path, 5, type: :bool, json_name: "stripFragmentFromPath"
end

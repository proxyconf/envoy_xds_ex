defmodule Envoy.Service.Auth.V3.AttributeContext.Peer.LabelsEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Service.Auth.V3.AttributeContext.Peer do
  @moduledoc """
  This message defines attributes for a node that handles a network request.
  The node can be either a service or an application that sends, forwards,
  or receives the request. Service peers should fill in the ``service``,
  ``principal``, and ``labels`` as appropriate.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :address, 1, type: Envoy.Config.Core.V3.Address
  field :service, 2, type: :string

  field :labels, 3,
    repeated: true,
    type: Envoy.Service.Auth.V3.AttributeContext.Peer.LabelsEntry,
    map: true

  field :principal, 4, type: :string
  field :certificate, 5, type: :string
end

defmodule Envoy.Service.Auth.V3.AttributeContext.Request do
  @moduledoc """
  Represents a network request, such as an HTTP request.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :time, 1, type: Google.Protobuf.Timestamp
  field :http, 2, type: Envoy.Service.Auth.V3.AttributeContext.HttpRequest
end

defmodule Envoy.Service.Auth.V3.AttributeContext.HttpRequest.HeadersEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Service.Auth.V3.AttributeContext.HttpRequest do
  @moduledoc """
  This message defines attributes for an HTTP request.
  HTTP/1.x, HTTP/2, gRPC are all considered as HTTP requests.
  [#next-free-field: 14]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :id, 1, type: :string
  field :method, 2, type: :string

  field :headers, 3,
    repeated: true,
    type: Envoy.Service.Auth.V3.AttributeContext.HttpRequest.HeadersEntry,
    map: true,
    deprecated: false

  field :header_map, 13,
    type: Envoy.Config.Core.V3.HeaderMap,
    json_name: "headerMap",
    deprecated: false

  field :path, 4, type: :string
  field :host, 5, type: :string
  field :scheme, 6, type: :string
  field :query, 7, type: :string
  field :fragment, 8, type: :string
  field :size, 9, type: :int64
  field :protocol, 10, type: :string
  field :body, 11, type: :string
  field :raw_body, 12, type: :bytes, json_name: "rawBody"
end

defmodule Envoy.Service.Auth.V3.AttributeContext.TLSSession do
  @moduledoc """
  This message defines attributes for the underlying TLS session.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :sni, 1, type: :string
end

defmodule Envoy.Service.Auth.V3.AttributeContext.ContextExtensionsEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Service.Auth.V3.AttributeContext do
  @moduledoc """
  An attribute is a piece of metadata that describes an activity on a network.
  For example, the size of an HTTP request, or the status code of an HTTP response.

  Each attribute has a type and a name, which is logically defined as a proto message field
  of the ``AttributeContext``. The ``AttributeContext`` is a collection of individual attributes
  supported by Envoy authorization system.
  [#comment: The following items are left out of this proto
  Request.Auth field for jwt tokens
  Request.Api for api management
  Origin peer that originated the request
  Caching Protocol
  request_context return values to inject back into the filter chain
  peer.claims -- from X.509 extensions
  Configuration
  - field mask to send
  - which return values from request_context are copied back
  - which return values are copied into request_headers]
  [#next-free-field: 14]
  [#protodoc-title: Attribute context]
  See :ref:`network filter configuration overview <config_network_filters_ext_authz>`
  and :ref:`HTTP filter configuration overview <config_http_filters_ext_authz>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :source, 1, type: Envoy.Service.Auth.V3.AttributeContext.Peer
  field :destination, 2, type: Envoy.Service.Auth.V3.AttributeContext.Peer
  field :request, 4, type: Envoy.Service.Auth.V3.AttributeContext.Request

  field :context_extensions, 10,
    repeated: true,
    type: Envoy.Service.Auth.V3.AttributeContext.ContextExtensionsEntry,
    json_name: "contextExtensions",
    map: true

  field :metadata_context, 11, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataContext"

  field :route_metadata_context, 13,
    type: Envoy.Config.Core.V3.Metadata,
    json_name: "routeMetadataContext"

  field :tls_session, 12,
    type: Envoy.Service.Auth.V3.AttributeContext.TLSSession,
    json_name: "tlsSession"
end

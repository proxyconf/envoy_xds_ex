defmodule Xds.Core.V3.ResourceLocator.Scheme do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :XDSTP, 0
  field :HTTP, 1
  field :FILE, 2
end

defmodule Xds.Core.V3.ResourceLocator.Directive do
  @moduledoc """
  Directives provide information to data-plane load balancers on how xDS
  resource names are to be interpreted and potentially further resolved. For
  example, they may provide alternative resource locators for when primary
  resolution fails. Directives are not part of resource names and do not
  appear in a xDS transport discovery request.

  When encoding to URIs, directives take the form:

  <directive name>=<string representation of directive value>

  For example, we can have alt=xdstp://foo/bar or entry=some%20thing. Each
  directive value type may have its own string encoding, in the case of
  ResourceLocator there is a recursive URI encoding.

  Percent encoding applies to the URI encoding of the directive value.
  Multiple directives are comma-separated, so the reserved characters that
  require percent encoding in a directive value are [',', '#', '[', ']',
  '%']. These are the RFC3986 fragment reserved characters with the addition
  of the xDS scheme specific ','. See
  https://tools.ietf.org/html/rfc3986#page-49 for further details on URI ABNF
  and reserved characters.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :directive, 0

  field :alt, 1, type: Xds.Core.V3.ResourceLocator, oneof: 0
  field :entry, 2, type: :string, oneof: 0, deprecated: false
end

defmodule Xds.Core.V3.ResourceLocator do
  @moduledoc """
  xDS resource locators identify a xDS resource name and instruct the
  data-plane load balancer on how the resource may be located.

  Resource locators have a canonical xdstp:// URI representation:

  xdstp://{authority}/{type_url}/{id}?{context_params}{#directive,*}

  where context_params take the form of URI query parameters.

  Resource locators have a similar canonical http:// URI representation:

  http://{authority}/{type_url}/{id}?{context_params}{#directive,*}

  Resource locators also have a simplified file:// URI representation:

  file:///{id}{#directive,*}
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :context_param_specifier, 0

  field :scheme, 1, type: Xds.Core.V3.ResourceLocator.Scheme, enum: true, deprecated: false
  field :id, 2, type: :string
  field :authority, 3, type: :string
  field :resource_type, 4, type: :string, json_name: "resourceType", deprecated: false
  field :exact_context, 5, type: Xds.Core.V3.ContextParams, json_name: "exactContext", oneof: 0
  field :directives, 6, repeated: true, type: Xds.Core.V3.ResourceLocator.Directive
end

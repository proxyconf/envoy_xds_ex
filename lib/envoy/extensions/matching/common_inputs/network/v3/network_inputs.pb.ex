defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.DestinationIPInput do
  @moduledoc """
  Specifies that matching should be performed by the destination IP address.
  [#extension: envoy.matching.inputs.destination_ip]
  [#protodoc-title: Common network matching inputs]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.DestinationPortInput do
  @moduledoc """
  Specifies that matching should be performed by the destination port.
  [#extension: envoy.matching.inputs.destination_port]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.SourceIPInput do
  @moduledoc """
  Specifies that matching should be performed by the source IP address.
  [#extension: envoy.matching.inputs.source_ip]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.SourcePortInput do
  @moduledoc """
  Specifies that matching should be performed by the source port.
  [#extension: envoy.matching.inputs.source_port]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.DirectSourceIPInput do
  @moduledoc """
  Input that matches by the directly connected source IP address (this
  will only be different from the source IP address when using a listener
  filter that overrides the source address, such as the :ref:`Proxy Protocol
  listener filter <config_listener_filters_proxy_protocol>`).
  [#extension: envoy.matching.inputs.direct_source_ip]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.SourceTypeInput do
  @moduledoc """
  Input that matches by the source IP type.
  Specifies the source IP match type. The values include:

  * ``local`` - matches a connection originating from the same host,
  [#extension: envoy.matching.inputs.source_type]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.ServerNameInput do
  @moduledoc """
  Input that matches by the requested server name (e.g. SNI in TLS).

  :ref:`TLS Inspector <config_listener_filters_tls_inspector>` provides the requested server name based on SNI,
  when TLS protocol is detected.
  [#extension: envoy.matching.inputs.server_name]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.TransportProtocolInput do
  @moduledoc """
  Input that matches by the transport protocol.

  Suggested values include:

  * ``raw_buffer`` - default, used when no transport protocol is detected,
  * ``tls`` - set by :ref:`envoy.filters.listener.tls_inspector <config_listener_filters_tls_inspector>`
  when TLS protocol is detected.
  [#extension: envoy.matching.inputs.transport_protocol]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.ApplicationProtocolInput do
  @moduledoc """
  List of quoted and comma-separated requested application protocols. The list consists of a
  single negotiated application protocol once the network stream is established.

  Examples:

  * ``'h2','http/1.1'``
  * ``'h2c'``

  Suggested values in the list include:

  * ``http/1.1`` - set by :ref:`envoy.filters.listener.tls_inspector
  <config_listener_filters_tls_inspector>` and :ref:`envoy.filters.listener.http_inspector
  <config_listener_filters_http_inspector>`,
  * ``h2`` - set by :ref:`envoy.filters.listener.tls_inspector <config_listener_filters_tls_inspector>`
  * ``h2c`` - set by :ref:`envoy.filters.listener.http_inspector <config_listener_filters_http_inspector>`

  .. attention::

  Currently, :ref:`TLS Inspector <config_listener_filters_tls_inspector>` provides
  application protocol detection based on the requested
  `ALPN <https://en.wikipedia.org/wiki/Application-Layer_Protocol_Negotiation>`_ values.

  However, the use of ALPN is pretty much limited to the HTTP/2 traffic on the Internet,
  and matching on values other than ``h2`` is going to lead to a lot of false negatives,
  unless all connecting clients are known to use ALPN.
  [#extension: envoy.matching.inputs.application_protocol]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.FilterStateInput do
  @moduledoc """
  Input that matches by a specific filter state key.
  The value of the provided filter state key will be the raw string representation of the filter state object
  [#extension: envoy.matching.inputs.filter_state]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.DynamicMetadataInput.PathSegment do
  @moduledoc """
  Specifies the segment in a path to retrieve value from Metadata.
  Note: Currently it's not supported to retrieve a value from a list in Metadata. This means that
  if the segment key refers to a list, it has to be the last segment in a path.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :segment, 0

  field :key, 1, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.DynamicMetadataInput do
  @moduledoc """
  Input that matches dynamic metadata by key.
  DynamicMetadataInput provides a general interface using ``filter`` and ``path`` to retrieve value from
  :ref:`Metadata <envoy_v3_api_msg_config.core.v3.Metadata>`.

  For example, for the following Metadata:

  .. code-block:: yaml

  filter_metadata:
  envoy.xxx:
  prop:
  foo: bar
  xyz:
  hello: envoy

  The following DynamicMetadataInput will retrieve a string value "bar" from the Metadata.

  .. code-block:: yaml

  filter: envoy.xxx
  path:
  - key: prop
  - key: foo

  [#extension: envoy.matching.inputs.dynamic_metadata]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :filter, 1, type: :string, deprecated: false

  field :path, 2,
    repeated: true,
    type: Envoy.Extensions.Matching.CommonInputs.Network.V3.DynamicMetadataInput.PathSegment,
    deprecated: false
end

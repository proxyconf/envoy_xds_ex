defmodule Envoy.Api.V2.Listener.FilterChainMatch.ConnectionSourceType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ANY, 0
  field :LOCAL, 1
  field :EXTERNAL, 2
end

defmodule Envoy.Api.V2.Listener.Filter do
  @moduledoc """
  [#protodoc-title: Listener components]
  Listener :ref:`configuration overview <config_listeners>`
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 4, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Api.V2.Listener.FilterChainMatch do
  @moduledoc """
  Specifies the match criteria for selecting a specific filter chain for a
  listener.

  In order for a filter chain to be selected, *ALL* of its criteria must be
  fulfilled by the incoming connection, properties of which are set by the
  networking stack and/or listener filters.

  The following order applies:

  1. Destination port.
  2. Destination IP address.
  3. Server name (e.g. SNI for TLS protocol),
  4. Transport protocol.
  5. Application protocols (e.g. ALPN for TLS protocol).
  6. Source type (e.g. any, local or external network).
  7. Source IP address.
  8. Source port.

  For criteria that allow ranges or wildcards, the most specific value in any
  of the configured filter chains that matches the incoming connection is going
  to be used (e.g. for SNI ``www.example.com`` the most specific match would be
  ``www.example.com``, then ``*.example.com``, then ``*.com``, then any filter
  chain without ``server_names`` requirements).

  [#comment: Implemented rules are kept in the preference order, with deprecated fields
  listed at the end, because that's how we want to list them in the docs.

  [#comment:TODO(PiotrSikora): Add support for configurable precedence of the rules]
  [#next-free-field: 13]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :destination_port, 8,
    type: Google.Protobuf.UInt32Value,
    json_name: "destinationPort",
    deprecated: false

  field :prefix_ranges, 3,
    repeated: true,
    type: Envoy.Api.V2.Core.CidrRange,
    json_name: "prefixRanges"

  field :address_suffix, 4, type: :string, json_name: "addressSuffix"
  field :suffix_len, 5, type: Google.Protobuf.UInt32Value, json_name: "suffixLen"

  field :source_type, 12,
    type: Envoy.Api.V2.Listener.FilterChainMatch.ConnectionSourceType,
    json_name: "sourceType",
    enum: true,
    deprecated: false

  field :source_prefix_ranges, 6,
    repeated: true,
    type: Envoy.Api.V2.Core.CidrRange,
    json_name: "sourcePrefixRanges"

  field :source_ports, 7,
    repeated: true,
    type: :uint32,
    json_name: "sourcePorts",
    deprecated: false

  field :server_names, 11, repeated: true, type: :string, json_name: "serverNames"
  field :transport_protocol, 9, type: :string, json_name: "transportProtocol"

  field :application_protocols, 10,
    repeated: true,
    type: :string,
    json_name: "applicationProtocols"
end

defmodule Envoy.Api.V2.Listener.FilterChain do
  @moduledoc """
  A filter chain wraps a set of match criteria, an option TLS context, a set of filters, and
  various other parameters.
  [#next-free-field: 8]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :filter_chain_match, 1,
    type: Envoy.Api.V2.Listener.FilterChainMatch,
    json_name: "filterChainMatch"

  field :tls_context, 2,
    type: Envoy.Api.V2.Auth.DownstreamTlsContext,
    json_name: "tlsContext",
    deprecated: true

  field :filters, 3, repeated: true, type: Envoy.Api.V2.Listener.Filter
  field :use_proxy_proto, 4, type: Google.Protobuf.BoolValue, json_name: "useProxyProto"
  field :metadata, 5, type: Envoy.Api.V2.Core.Metadata

  field :transport_socket, 6,
    type: Envoy.Api.V2.Core.TransportSocket,
    json_name: "transportSocket"

  field :name, 7, type: :string
end

defmodule Envoy.Api.V2.Listener.ListenerFilterChainMatchPredicate.MatchSet do
  @moduledoc """
  A set of match configurations used for logical operations.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :rules, 1,
    repeated: true,
    type: Envoy.Api.V2.Listener.ListenerFilterChainMatchPredicate,
    deprecated: false
end

defmodule Envoy.Api.V2.Listener.ListenerFilterChainMatchPredicate do
  @moduledoc """
  Listener filter chain match configuration. This is a recursive structure which allows complex
  nested match configurations to be built using various logical operators.

  Examples:

  * Matches if the destination port is 3306.

  .. code-block:: yaml

  destination_port_range:
  start: 3306
  end: 3307

  * Matches if the destination port is 3306 or 15000.

  .. code-block:: yaml

  or_match:
  rules:
  - destination_port_range:
  start: 3306
  end: 3307
  - destination_port_range:
  start: 15000
  end: 15001

  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :rule, 0

  field :or_match, 1,
    type: Envoy.Api.V2.Listener.ListenerFilterChainMatchPredicate.MatchSet,
    json_name: "orMatch",
    oneof: 0

  field :and_match, 2,
    type: Envoy.Api.V2.Listener.ListenerFilterChainMatchPredicate.MatchSet,
    json_name: "andMatch",
    oneof: 0

  field :not_match, 3,
    type: Envoy.Api.V2.Listener.ListenerFilterChainMatchPredicate,
    json_name: "notMatch",
    oneof: 0

  field :any_match, 4, type: :bool, json_name: "anyMatch", oneof: 0, deprecated: false

  field :destination_port_range, 5,
    type: Envoy.Type.Int32Range,
    json_name: "destinationPortRange",
    oneof: 0
end

defmodule Envoy.Api.V2.Listener.ListenerFilter do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0

  field :filter_disabled, 4,
    type: Envoy.Api.V2.Listener.ListenerFilterChainMatchPredicate,
    json_name: "filterDisabled"
end

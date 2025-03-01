defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.CodecType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :AUTO, 0
  field :HTTP1, 1
  field :HTTP2, 2
  field :HTTP3, 3
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.ServerHeaderTransformation do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :OVERWRITE, 0
  field :APPEND_IF_ABSENT, 1
  field :PASS_THROUGH, 2
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.ForwardClientCertDetails do
  @moduledoc """
  How to handle the :ref:`config_http_conn_man_headers_x-forwarded-client-cert` (XFCC) HTTP
  header.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :SANITIZE, 0
  field :FORWARD_ONLY, 1
  field :APPEND_FORWARD, 2
  field :SANITIZE_SET, 3
  field :ALWAYS_FORWARD_ONLY, 4
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.Tracing.OperationName do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :INGRESS, 0
  field :EGRESS, 1
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.Tracing do
  @moduledoc """
  [#next-free-field: 10]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :operation_name, 1,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.Tracing.OperationName,
    json_name: "operationName",
    enum: true,
    deprecated: true

  field :request_headers_for_tags, 2,
    repeated: true,
    type: :string,
    json_name: "requestHeadersForTags",
    deprecated: true

  field :client_sampling, 3, type: Envoy.Type.Percent, json_name: "clientSampling"
  field :random_sampling, 4, type: Envoy.Type.Percent, json_name: "randomSampling"
  field :overall_sampling, 5, type: Envoy.Type.Percent, json_name: "overallSampling"
  field :verbose, 6, type: :bool
  field :max_path_tag_length, 7, type: Google.Protobuf.UInt32Value, json_name: "maxPathTagLength"

  field :custom_tags, 8,
    repeated: true,
    type: Envoy.Type.Tracing.V2.CustomTag,
    json_name: "customTags"

  field :provider, 9, type: Envoy.Config.Trace.V2.Tracing.Http
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.InternalAddressConfig do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :unix_sockets, 1, type: :bool, json_name: "unixSockets"
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.SetCurrentClientCertDetails do
  @moduledoc """
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :subject, 1, type: Google.Protobuf.BoolValue
  field :cert, 3, type: :bool
  field :chain, 6, type: :bool
  field :dns, 4, type: :bool
  field :uri, 5, type: :bool
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.UpgradeConfig do
  @moduledoc """
  The configuration for HTTP upgrades.
  For each upgrade type desired, an UpgradeConfig must be added.

  .. warning::

  The current implementation of upgrade headers does not handle
  multi-valued upgrade headers. Support for multi-valued headers may be
  added in the future if needed.

  .. warning::
  The current implementation of upgrade headers does not work with HTTP/2
  upstreams.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :upgrade_type, 1, type: :string, json_name: "upgradeType"

  field :filters, 2,
    repeated: true,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpFilter

  field :enabled, 3, type: Google.Protobuf.BoolValue
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager do
  @moduledoc """
  [#next-free-field: 37]
  [#protodoc-title: HTTP connection manager]
  HTTP connection manager :ref:`configuration overview <config_http_conn_man>`.
  [#extension: envoy.filters.network.http_connection_manager]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :route_specifier, 0

  field :codec_type, 1,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.CodecType,
    json_name: "codecType",
    enum: true,
    deprecated: false

  field :stat_prefix, 2, type: :string, json_name: "statPrefix", deprecated: false
  field :rds, 3, type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.Rds, oneof: 0

  field :route_config, 4,
    type: Envoy.Api.V2.RouteConfiguration,
    json_name: "routeConfig",
    oneof: 0

  field :scoped_routes, 31,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes,
    json_name: "scopedRoutes",
    oneof: 0

  field :http_filters, 5,
    repeated: true,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpFilter,
    json_name: "httpFilters"

  field :add_user_agent, 6, type: Google.Protobuf.BoolValue, json_name: "addUserAgent"

  field :tracing, 7,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.Tracing

  field :common_http_protocol_options, 35,
    type: Envoy.Api.V2.Core.HttpProtocolOptions,
    json_name: "commonHttpProtocolOptions"

  field :http_protocol_options, 8,
    type: Envoy.Api.V2.Core.Http1ProtocolOptions,
    json_name: "httpProtocolOptions"

  field :http2_protocol_options, 9,
    type: Envoy.Api.V2.Core.Http2ProtocolOptions,
    json_name: "http2ProtocolOptions"

  field :server_name, 10, type: :string, json_name: "serverName"

  field :server_header_transformation, 34,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.ServerHeaderTransformation,
    json_name: "serverHeaderTransformation",
    enum: true,
    deprecated: false

  field :max_request_headers_kb, 29,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxRequestHeadersKb",
    deprecated: false

  field :idle_timeout, 11,
    type: Google.Protobuf.Duration,
    json_name: "idleTimeout",
    deprecated: true

  field :stream_idle_timeout, 24, type: Google.Protobuf.Duration, json_name: "streamIdleTimeout"
  field :request_timeout, 28, type: Google.Protobuf.Duration, json_name: "requestTimeout"
  field :drain_timeout, 12, type: Google.Protobuf.Duration, json_name: "drainTimeout"

  field :delayed_close_timeout, 26,
    type: Google.Protobuf.Duration,
    json_name: "delayedCloseTimeout"

  field :access_log, 13,
    repeated: true,
    type: Envoy.Config.Filter.Accesslog.V2.AccessLog,
    json_name: "accessLog"

  field :use_remote_address, 14, type: Google.Protobuf.BoolValue, json_name: "useRemoteAddress"
  field :xff_num_trusted_hops, 19, type: :uint32, json_name: "xffNumTrustedHops"

  field :internal_address_config, 25,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.InternalAddressConfig,
    json_name: "internalAddressConfig"

  field :skip_xff_append, 21, type: :bool, json_name: "skipXffAppend"
  field :via, 22, type: :string
  field :generate_request_id, 15, type: Google.Protobuf.BoolValue, json_name: "generateRequestId"
  field :preserve_external_request_id, 32, type: :bool, json_name: "preserveExternalRequestId"

  field :forward_client_cert_details, 16,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.ForwardClientCertDetails,
    json_name: "forwardClientCertDetails",
    enum: true,
    deprecated: false

  field :set_current_client_cert_details, 17,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.SetCurrentClientCertDetails,
    json_name: "setCurrentClientCertDetails"

  field :proxy_100_continue, 18, type: :bool, json_name: "proxy100Continue"

  field :represent_ipv4_remote_address_as_ipv4_mapped_ipv6, 20,
    type: :bool,
    json_name: "representIpv4RemoteAddressAsIpv4MappedIpv6"

  field :upgrade_configs, 23,
    repeated: true,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpConnectionManager.UpgradeConfig,
    json_name: "upgradeConfigs"

  field :normalize_path, 30, type: Google.Protobuf.BoolValue, json_name: "normalizePath"
  field :merge_slashes, 33, type: :bool, json_name: "mergeSlashes"

  field :request_id_extension, 36,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.RequestIDExtension,
    json_name: "requestIdExtension"
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.Rds do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :config_source, 1,
    type: Envoy.Api.V2.Core.ConfigSource,
    json_name: "configSource",
    deprecated: false

  field :route_config_name, 2, type: :string, json_name: "routeConfigName", deprecated: false
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRouteConfigurationsList do
  @moduledoc """
  This message is used to work around the limitations with 'oneof' and repeated fields.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :scoped_route_configurations, 1,
    repeated: true,
    type: Envoy.Api.V2.ScopedRouteConfiguration,
    json_name: "scopedRouteConfigurations",
    deprecated: false
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor.KvElement do
  @moduledoc """
  Specifies a header field's key value pair to match on.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :separator, 1, type: :string, deprecated: false
  field :key, 2, type: :string, deprecated: false
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor do
  @moduledoc """
  Specifies how the value of a header should be extracted.
  The following example maps the structure of a header to the fields in this message.

  .. code::

  <0> <1>   <-- index
  X-Header: a=b;c=d
  |         || |
  |         || \----> <element_separator>
  |         ||
  |         |\----> <element.separator>
  |         |
  |         \----> <element.key>
  |
  \----> <name>

  Each 'a=b' key-value pair constitutes an 'element' of the header field.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :extract_type, 0

  field :name, 1, type: :string, deprecated: false
  field :element_separator, 2, type: :string, json_name: "elementSeparator"
  field :index, 3, type: :uint32, oneof: 0

  field :element, 4,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor.KvElement,
    oneof: 0
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder do
  @moduledoc """
  Specifies the mechanism for constructing key fragments which are composed into scope keys.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :type, 0

  field :header_value_extractor, 1,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder.HeaderValueExtractor,
    json_name: "headerValueExtractor",
    oneof: 0
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes.ScopeKeyBuilder do
  @moduledoc """
  Specifies the mechanism for constructing "scope keys" based on HTTP request attributes. These
  keys are matched against a set of :ref:`Key<envoy_api_msg_ScopedRouteConfiguration.Key>`
  objects assembled from :ref:`ScopedRouteConfiguration<envoy_api_msg_ScopedRouteConfiguration>`
  messages distributed via SRDS (the Scoped Route Discovery Service) or assigned statically via
  :ref:`scoped_route_configurations_list<envoy_api_field_config.filter.network.http_connection_manager.v2.ScopedRoutes.scoped_route_configurations_list>`.

  Upon receiving a request's headers, the Router will build a key using the algorithm specified
  by this message. This key will be used to look up the routing table (i.e., the
  :ref:`RouteConfiguration<envoy_api_msg_RouteConfiguration>`) to use for the request.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :fragments, 1,
    repeated: true,
    type:
      Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes.ScopeKeyBuilder.FragmentBuilder,
    deprecated: false
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_specifier, 0

  field :name, 1, type: :string, deprecated: false

  field :scope_key_builder, 2,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRoutes.ScopeKeyBuilder,
    json_name: "scopeKeyBuilder",
    deprecated: false

  field :rds_config_source, 3,
    type: Envoy.Api.V2.Core.ConfigSource,
    json_name: "rdsConfigSource",
    deprecated: false

  field :scoped_route_configurations_list, 4,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRouteConfigurationsList,
    json_name: "scopedRouteConfigurationsList",
    oneof: 0

  field :scoped_rds, 5,
    type: Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRds,
    json_name: "scopedRds",
    oneof: 0
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.ScopedRds do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :scoped_rds_config_source, 1,
    type: Envoy.Api.V2.Core.ConfigSource,
    json_name: "scopedRdsConfigSource",
    deprecated: false
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.HttpFilter do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 4, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Filter.Network.HttpConnectionManager.V2.RequestIDExtension do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :typed_config, 1, type: Google.Protobuf.Any, json_name: "typedConfig"
end

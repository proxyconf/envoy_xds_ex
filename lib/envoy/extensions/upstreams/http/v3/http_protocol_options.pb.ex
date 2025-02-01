defmodule Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.ExplicitHttpConfig do
  @moduledoc """
  If this is used, the cluster will only operate on one of the possible upstream protocols.
  Note that HTTP/2 or above should generally be used for upstream gRPC clusters.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :protocol_config, 0

  field :http_protocol_options, 1,
    type: Envoy.Config.Core.V3.Http1ProtocolOptions,
    json_name: "httpProtocolOptions",
    oneof: 0

  field :http2_protocol_options, 2,
    type: Envoy.Config.Core.V3.Http2ProtocolOptions,
    json_name: "http2ProtocolOptions",
    oneof: 0

  field :http3_protocol_options, 3,
    type: Envoy.Config.Core.V3.Http3ProtocolOptions,
    json_name: "http3ProtocolOptions",
    oneof: 0
end

defmodule Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.UseDownstreamHttpConfig do
  @moduledoc """
  If this is used, the cluster can use either of the configured protocols, and
  will use whichever protocol was used by the downstream connection.

  If HTTP/3 is configured for downstream and not configured for upstream,
  HTTP/3 requests will fail over to HTTP/2.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :http_protocol_options, 1,
    type: Envoy.Config.Core.V3.Http1ProtocolOptions,
    json_name: "httpProtocolOptions"

  field :http2_protocol_options, 2,
    type: Envoy.Config.Core.V3.Http2ProtocolOptions,
    json_name: "http2ProtocolOptions"

  field :http3_protocol_options, 3,
    type: Envoy.Config.Core.V3.Http3ProtocolOptions,
    json_name: "http3ProtocolOptions"
end

defmodule Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.AutoHttpConfig do
  @moduledoc """
  If this is used, the cluster can use either HTTP/1 or HTTP/2, and will use whichever
  protocol is negotiated by ALPN with the upstream.
  Clusters configured with ``AutoHttpConfig`` will use the highest available
  protocol; HTTP/2 if supported, otherwise HTTP/1.
  If the upstream does not support ALPN, ``AutoHttpConfig`` will fail over to HTTP/1.
  This can only be used with transport sockets which support ALPN. Using a
  transport socket which does not support ALPN will result in configuration
  failure. The transport layer may be configured with custom ALPN, but the default ALPN
  for the cluster (or if custom ALPN fails) will be "h2,http/1.1".
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :http_protocol_options, 1,
    type: Envoy.Config.Core.V3.Http1ProtocolOptions,
    json_name: "httpProtocolOptions"

  field :http2_protocol_options, 2,
    type: Envoy.Config.Core.V3.Http2ProtocolOptions,
    json_name: "http2ProtocolOptions"

  field :http3_protocol_options, 3,
    type: Envoy.Config.Core.V3.Http3ProtocolOptions,
    json_name: "http3ProtocolOptions"

  field :alternate_protocols_cache_options, 4,
    type: Envoy.Config.Core.V3.AlternateProtocolsCacheOptions,
    json_name: "alternateProtocolsCacheOptions"
end

defmodule Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions do
  @moduledoc """
  HttpProtocolOptions specifies Http upstream protocol options. This object
  is used in
  :ref:`typed_extension_protocol_options<envoy_v3_api_field_config.cluster.v3.Cluster.typed_extension_protocol_options>`,
  keyed by the name ``envoy.extensions.upstreams.http.v3.HttpProtocolOptions``.

  This controls what protocol(s) should be used for upstream and how said protocol(s) are configured.

  This replaces the prior pattern of explicit protocol configuration directly
  in the cluster. So a configuration like this, explicitly configuring the use of HTTP/2 upstream:

  .. code::

  clusters:
  - name: some_service
  connect_timeout: 5s
  upstream_http_protocol_options:
  auto_sni: true
  common_http_protocol_options:
  idle_timeout: 1s
  http2_protocol_options:
  max_concurrent_streams: 100
  .... [further cluster config]

  Would now look like this:

  .. code::

  clusters:
  - name: some_service
  connect_timeout: 5s
  typed_extension_protocol_options:
  envoy.extensions.upstreams.http.v3.HttpProtocolOptions:
  "@type": type.googleapis.com/envoy.extensions.upstreams.http.v3.HttpProtocolOptions
  upstream_http_protocol_options:
  auto_sni: true
  common_http_protocol_options:
  idle_timeout: 1s
  explicit_http_config:
  http2_protocol_options:
  max_concurrent_streams: 100
  .... [further cluster config]
  [#next-free-field: 8]
  [#protodoc-title: HTTP Protocol Options]
  [#extension: envoy.upstreams.http.http_protocol_options]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :upstream_protocol_options, 0

  field :common_http_protocol_options, 1,
    type: Envoy.Config.Core.V3.HttpProtocolOptions,
    json_name: "commonHttpProtocolOptions"

  field :upstream_http_protocol_options, 2,
    type: Envoy.Config.Core.V3.UpstreamHttpProtocolOptions,
    json_name: "upstreamHttpProtocolOptions"

  field :explicit_http_config, 3,
    type: Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.ExplicitHttpConfig,
    json_name: "explicitHttpConfig",
    oneof: 0

  field :use_downstream_protocol_config, 4,
    type: Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.UseDownstreamHttpConfig,
    json_name: "useDownstreamProtocolConfig",
    oneof: 0

  field :auto_config, 5,
    type: Envoy.Extensions.Upstreams.Http.V3.HttpProtocolOptions.AutoHttpConfig,
    json_name: "autoConfig",
    oneof: 0

  field :http_filters, 6,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpFilter,
    json_name: "httpFilters"

  field :header_validation_config, 7,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "headerValidationConfig"
end

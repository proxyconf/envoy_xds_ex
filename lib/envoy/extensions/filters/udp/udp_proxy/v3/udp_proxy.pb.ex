defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.HashPolicy do
  @moduledoc """
  Specifies the UDP hash policy.
  The packets can be routed by hash policy.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :policy_specifier, 0

  field :source_ip, 1, type: :bool, json_name: "sourceIp", oneof: 0, deprecated: false
  field :key, 2, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.SessionFilter do
  @moduledoc """
  Configuration for UDP session filters.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 2, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0

  field :config_discovery, 3,
    type: Envoy.Config.Core.V3.ExtensionConfigSource,
    json_name: "configDiscovery",
    oneof: 0
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.UdpTunnelingConfig.BufferOptions do
  @moduledoc """
  Configuration for UDP datagrams buffering.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :max_buffered_datagrams, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxBufferedDatagrams"

  field :max_buffered_bytes, 2, type: Google.Protobuf.UInt64Value, json_name: "maxBufferedBytes"
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.UdpTunnelingConfig.RetryOptions do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :max_connect_attempts, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConnectAttempts"

  field :backoff_options, 2,
    type: Envoy.Config.Core.V3.BackoffStrategy,
    json_name: "backoffOptions"
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.UdpTunnelingConfig do
  @moduledoc """
  Configuration for tunneling UDP over other transports or application layers.
  Tunneling is currently supported over HTTP/2.
  [#next-free-field: 12]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :proxy_host, 1, type: :string, json_name: "proxyHost", deprecated: false
  field :proxy_port, 2, type: Google.Protobuf.UInt32Value, json_name: "proxyPort"
  field :target_host, 3, type: :string, json_name: "targetHost", deprecated: false
  field :default_target_port, 4, type: :uint32, json_name: "defaultTargetPort", deprecated: false
  field :use_post, 5, type: :bool, json_name: "usePost"
  field :post_path, 6, type: :string, json_name: "postPath"

  field :retry_options, 7,
    type: Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.UdpTunnelingConfig.RetryOptions,
    json_name: "retryOptions"

  field :headers_to_add, 8,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "headersToAdd",
    deprecated: false

  field :buffer_options, 9,
    type:
      Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.UdpTunnelingConfig.BufferOptions,
    json_name: "bufferOptions"

  field :propagate_response_headers, 10, type: :bool, json_name: "propagateResponseHeaders"
  field :propagate_response_trailers, 11, type: :bool, json_name: "propagateResponseTrailers"
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.UdpAccessLogOptions do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :access_log_flush_interval, 1,
    type: Google.Protobuf.Duration,
    json_name: "accessLogFlushInterval",
    deprecated: false

  field :flush_access_log_on_tunnel_connected, 2,
    type: :bool,
    json_name: "flushAccessLogOnTunnelConnected"
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig do
  @moduledoc """
  Configuration for the UDP proxy filter.
  [#next-free-field: 14]
  [#protodoc-title: UDP proxy]
  UDP proxy :ref:`configuration overview <config_udp_listener_filters_udp_proxy>`.
  [#extension: envoy.filters.udp_listener.udp_proxy]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :route_specifier, 0

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :cluster, 2, type: :string, oneof: 0, deprecated: true
  field :matcher, 9, type: Xds.Type.Matcher.V3.Matcher, oneof: 0, deprecated: false
  field :idle_timeout, 3, type: Google.Protobuf.Duration, json_name: "idleTimeout"
  field :use_original_src_ip, 4, type: :bool, json_name: "useOriginalSrcIp"

  field :hash_policies, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.HashPolicy,
    json_name: "hashPolicies",
    deprecated: false

  field :upstream_socket_config, 6,
    type: Envoy.Config.Core.V3.UdpSocketConfig,
    json_name: "upstreamSocketConfig"

  field :use_per_packet_load_balancing, 7, type: :bool, json_name: "usePerPacketLoadBalancing"

  field :access_log, 8,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "accessLog"

  field :proxy_access_log, 10,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "proxyAccessLog"

  field :session_filters, 11,
    repeated: true,
    type: Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.SessionFilter,
    json_name: "sessionFilters"

  field :tunneling_config, 12,
    type: Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.UdpTunnelingConfig,
    json_name: "tunnelingConfig"

  field :access_log_options, 13,
    type: Envoy.Extensions.Filters.Udp.UdpProxy.V3.UdpProxyConfig.UdpAccessLogOptions,
    json_name: "accessLogOptions"
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.Session.DynamicForwardProxy.V3.FilterConfig.BufferOptions do
  @moduledoc """
  Configuration for UDP datagrams buffering.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :max_buffered_datagrams, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxBufferedDatagrams"

  field :max_buffered_bytes, 2, type: Google.Protobuf.UInt64Value, json_name: "maxBufferedBytes"
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.Session.DynamicForwardProxy.V3.FilterConfig do
  @moduledoc """
  Configuration for the filter state based dynamic forward proxy filter. See the
  :ref:`architecture overview <arch_overview_http_dynamic_forward_proxy>` for
  more information. Note this filter must be used in conjunction to another filter that
  sets the 'envoy.upstream.dynamic_host' and the 'envoy.upstream.dynamic_port' filter
  state keys for the required upstream UDP session.
  [#extension: envoy.filters.udp.session.dynamic_forward_proxy]
  [#protodoc-title: Filter state dynamic forward proxy]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :implementation_specifier, 0

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :dns_cache_config, 2,
    type: Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheConfig,
    json_name: "dnsCacheConfig",
    oneof: 0,
    deprecated: false

  field :buffer_options, 3,
    type:
      Envoy.Extensions.Filters.Udp.UdpProxy.Session.DynamicForwardProxy.V3.FilterConfig.BufferOptions,
    json_name: "bufferOptions"
end

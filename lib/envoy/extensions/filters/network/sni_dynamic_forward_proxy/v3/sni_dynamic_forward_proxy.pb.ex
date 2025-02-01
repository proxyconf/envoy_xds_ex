defmodule Envoy.Extensions.Filters.Network.SniDynamicForwardProxy.V3.FilterConfig do
  @moduledoc """
  Configuration for the SNI-based dynamic forward proxy filter. See the
  :ref:`architecture overview <arch_overview_http_dynamic_forward_proxy>` for
  more information. Note this filter must be configured along with
  :ref:`TLS inspector listener filter <config_listener_filters_tls_inspector>`
  to work.
  [#extension: envoy.filters.network.sni_dynamic_forward_proxy]
  [#protodoc-title: SNI dynamic forward proxy]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :port_specifier, 0

  field :dns_cache_config, 1,
    type: Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheConfig,
    json_name: "dnsCacheConfig",
    deprecated: false

  field :port_value, 2, type: :uint32, json_name: "portValue", oneof: 0, deprecated: false
  field :save_upstream_address, 3, type: :bool, json_name: "saveUpstreamAddress"
end

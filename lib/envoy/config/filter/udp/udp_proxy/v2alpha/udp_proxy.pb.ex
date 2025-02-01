defmodule Envoy.Config.Filter.Udp.UdpProxy.V2alpha.UdpProxyConfig do
  @moduledoc """
  Configuration for the UDP proxy filter.
  [#protodoc-title: UDP proxy]
  UDP proxy :ref:`configuration overview <config_udp_listener_filters_udp_proxy>`.
  [#extension: envoy.filters.udp_listener.udp_proxy]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :route_specifier, 0

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :cluster, 2, type: :string, oneof: 0, deprecated: false
  field :idle_timeout, 3, type: Google.Protobuf.Duration, json_name: "idleTimeout"
end

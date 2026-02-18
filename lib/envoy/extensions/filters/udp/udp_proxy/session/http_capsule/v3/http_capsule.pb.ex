defmodule Envoy.Extensions.Filters.Udp.UdpProxy.Session.HttpCapsule.V3.FilterConfig do
  @moduledoc """
  [#protodoc-title: UDP HTTP Capsule filter]
  UDP to HTTP capsules :ref:`overview <config_udp_session_filters_http_capsule>`.
  [#extension: envoy.filters.udp.session.http_capsule]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.udp.udp_proxy.session.http_capsule.v3.FilterConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

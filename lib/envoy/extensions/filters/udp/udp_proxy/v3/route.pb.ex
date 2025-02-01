defmodule Envoy.Extensions.Filters.Udp.UdpProxy.V3.Route do
  @moduledoc """
  [#protodoc-title: UDP proxy route configuration]
  UDP proxy :ref:`configuration overview <config_udp_listener_filters_udp_proxy>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cluster, 1, type: :string, deprecated: false
end

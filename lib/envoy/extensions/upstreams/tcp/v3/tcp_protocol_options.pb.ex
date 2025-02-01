defmodule Envoy.Extensions.Upstreams.Tcp.V3.TcpProtocolOptions do
  @moduledoc """
  [#protodoc-title: TCP Protocol Options]
  [#extension: envoy.upstreams.tcp.tcp_protocol_options]
  TCProtocolOptions specifies TCP upstream protocol options. This object
  is used in
  :ref:`typed_extension_protocol_options<envoy_v3_api_field_config.cluster.v3.Cluster.typed_extension_protocol_options>`,
  keyed by the name ``envoy.extensions.upstreams.tcp.v3.TcpProtocolOptions``.

  .. code::

  clusters:
  - name: some_service
  connect_timeout: 5s
  typed_extension_protocol_options:
  envoy.extensions.upstreams.tcp.v3.TcpProtocolOptions:
  "@type": type.googleapis.com/envoy.extensions.upstreams.tcp.v3.TcpProtocolOptions
  idle_timeout: 10m
  .... [further cluster config]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :idle_timeout, 1, type: Google.Protobuf.Duration, json_name: "idleTimeout"
end

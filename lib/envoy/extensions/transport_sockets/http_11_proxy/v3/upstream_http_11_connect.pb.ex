defmodule Envoy.Extensions.TransportSockets.Http11Proxy.V3.Http11ProxyUpstreamTransport do
  @moduledoc """
  HTTP/1.1 proxy transport socket establishes an upstream connection to a proxy address
  instead of the target host's address. This behavior is triggered when the transport
  socket is configured and proxy information is provided.

  Behavior when proxying:
  =======================
  When an upstream connection is established, instead of connecting directly to the endpoint
  address, the client will connect to the specified proxy address, send an HTTP/1.1 ``CONNECT`` request
  indicating the endpoint address, and process the response. If the response has HTTP status 200,
  the connection will be passed down to the underlying transport socket.

  Configuring proxy information:
  ==============================
  Set ``typed_filter_metadata`` in :ref:`LbEndpoint.Metadata <envoy_v3_api_field_config.endpoint.v3.lbendpoint.metadata>` or :ref:`LocalityLbEndpoints.Metadata <envoy_v3_api_field_config.endpoint.v3.LocalityLbEndpoints.metadata>`.
  using the key ``envoy.http11_proxy_transport_socket.proxy_address`` and the
  proxy address in ``config::core::v3::Address`` format.
  [#protodoc-title: Upstream HTTP/1.1 Proxy]
  [#extension: envoy.transport_sockets.http_11_proxy]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :transport_socket, 1,
    type: Envoy.Config.Core.V3.TransportSocket,
    json_name: "transportSocket"
end

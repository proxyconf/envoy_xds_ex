defmodule Envoy.Extensions.TransportSockets.Starttls.V3.StartTlsConfig do
  @moduledoc """
  Configuration for a downstream StartTls transport socket.
  StartTls transport socket wraps two sockets:
  * raw_buffer socket which is used at the beginning of the session
  * TLS socket used when a protocol negotiates a switch to encrypted traffic.
  [#protodoc-title: StartTls]
  [#extension: envoy.transport_sockets.starttls]
  StartTls transport socket addresses situations when a protocol starts in clear-text and
  negotiates an in-band switch to TLS. StartTls transport socket is protocol agnostic. In the
  case of downstream StartTls a network filter is required which understands protocol exchange
  and a state machine to signal to the StartTls transport socket when a switch to TLS is
  required. Similarly, upstream StartTls requires the owner of an upstream transport socket to
  manage the state machine necessary to properly coordinate negotiation with the upstream and
  signal to the transport socket when a switch to secure transport is required.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cleartext_socket_config, 1,
    type: Envoy.Extensions.TransportSockets.RawBuffer.V3.RawBuffer,
    json_name: "cleartextSocketConfig"

  field :tls_socket_config, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext,
    json_name: "tlsSocketConfig",
    deprecated: false
end

defmodule Envoy.Extensions.TransportSockets.Starttls.V3.UpstreamStartTlsConfig do
  @moduledoc """
  Configuration for an upstream StartTls transport socket.
  StartTls transport socket wraps two sockets:
  * raw_buffer socket which is used at the beginning of the session
  * TLS socket used when a protocol negotiates a switch to encrypted traffic.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cleartext_socket_config, 1,
    type: Envoy.Extensions.TransportSockets.RawBuffer.V3.RawBuffer,
    json_name: "cleartextSocketConfig"

  field :tls_socket_config, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V3.UpstreamTlsContext,
    json_name: "tlsSocketConfig",
    deprecated: false
end

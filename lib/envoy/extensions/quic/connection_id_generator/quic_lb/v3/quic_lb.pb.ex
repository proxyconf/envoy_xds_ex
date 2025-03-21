defmodule Envoy.Extensions.Quic.ConnectionIdGenerator.QuicLb.V3.Config do
  @moduledoc """
  Configuration for a connection ID generator implementation for the QUIC-LB draft RFC for
  routable connection IDs.

  Connection IDs always have the length self encoded, as described in
  https://datatracker.ietf.org/doc/html/draft-ietf-quic-load-balancers#name-length-self-description.

  See https://datatracker.ietf.org/doc/html/draft-ietf-quic-load-balancers for details.

  .. warning::

  This is still a work in progress. Performance is expected to be poor. Interoperability testing
  has not yet been performed.
  [#next-free-field: 6]
  [#protodoc-title: QUIC-LB connection ID generator config]
  [#extension: envoy.quic.connection_id_generator.quic_lb]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :unsafe_unencrypted_testing_mode, 1,
    type: :bool,
    json_name: "unsafeUnencryptedTestingMode"

  field :server_id, 2,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "serverId",
    deprecated: false

  field :expected_server_id_length, 3,
    type: :uint32,
    json_name: "expectedServerIdLength",
    deprecated: false

  field :nonce_length_bytes, 4, type: :uint32, json_name: "nonceLengthBytes", deprecated: false

  field :encryption_parameters, 5,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig,
    json_name: "encryptionParameters",
    deprecated: false
end

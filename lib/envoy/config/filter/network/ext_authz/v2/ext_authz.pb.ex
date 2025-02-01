defmodule Envoy.Config.Filter.Network.ExtAuthz.V2.ExtAuthz do
  @moduledoc """
  External Authorization filter calls out to an external service over the
  gRPC Authorization API defined by
  :ref:`CheckRequest <envoy_api_msg_service.auth.v2.CheckRequest>`.
  A failed check will cause this filter to close the TCP connection.
  [#protodoc-title: Network External Authorization ]
  The network layer external authorization service configuration
  :ref:`configuration overview <config_network_filters_ext_authz>`.
  [#extension: envoy.filters.network.ext_authz]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :grpc_service, 2, type: Envoy.Api.V2.Core.GrpcService, json_name: "grpcService"
  field :failure_mode_allow, 3, type: :bool, json_name: "failureModeAllow"
  field :include_peer_certificate, 4, type: :bool, json_name: "includePeerCertificate"
end

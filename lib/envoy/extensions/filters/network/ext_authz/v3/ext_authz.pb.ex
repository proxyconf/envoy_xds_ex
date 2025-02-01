defmodule Envoy.Extensions.Filters.Network.ExtAuthz.V3.ExtAuthz do
  @moduledoc """
  External Authorization filter calls out to an external service over the
  gRPC Authorization API defined by
  :ref:`CheckRequest <envoy_v3_api_msg_service.auth.v3.CheckRequest>`.
  A failed check will cause this filter to close the TCP connection.
  [#next-free-field: 9]
  [#protodoc-title: Network External Authorization ]
  The network layer external authorization service configuration
  :ref:`configuration overview <config_network_filters_ext_authz>`.
  [#extension: envoy.filters.network.ext_authz]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :grpc_service, 2, type: Envoy.Config.Core.V3.GrpcService, json_name: "grpcService"
  field :failure_mode_allow, 3, type: :bool, json_name: "failureModeAllow"
  field :include_peer_certificate, 4, type: :bool, json_name: "includePeerCertificate"

  field :transport_api_version, 5,
    type: Envoy.Config.Core.V3.ApiVersion,
    json_name: "transportApiVersion",
    enum: true,
    deprecated: false

  field :filter_enabled_metadata, 6,
    type: Envoy.Type.Matcher.V3.MetadataMatcher,
    json_name: "filterEnabledMetadata"

  field :bootstrap_metadata_labels_key, 7, type: :string, json_name: "bootstrapMetadataLabelsKey"
  field :include_tls_session, 8, type: :bool, json_name: "includeTlsSession"
end

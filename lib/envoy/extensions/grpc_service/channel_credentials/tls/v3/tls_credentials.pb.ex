defmodule Envoy.Extensions.GrpcService.ChannelCredentials.Tls.V3.TlsCredentials do
  @moduledoc """
  [#not-implemented-hide:]
  [#protodoc-title: gRPC TLS Credentials]
  """

  use Protobuf,
    full_name: "envoy.extensions.grpc_service.channel_credentials.tls.v3.TlsCredentials",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :root_certificate_provider, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProviderInstance,
    json_name: "rootCertificateProvider"

  field :identity_certificate_provider, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProviderInstance,
    json_name: "identityCertificateProvider"
end

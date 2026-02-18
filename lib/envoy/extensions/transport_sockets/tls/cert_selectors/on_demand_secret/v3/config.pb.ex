defmodule Envoy.Extensions.TransportSockets.Tls.CertSelectors.OnDemandSecret.V3.Config do
  @moduledoc """
  Fetches the secret on-demand while allowing the parent cluster or listener to accept connections
  without warming. During the handshake, a secret name is derived from the peer hello message, an
  SDS resource request starts, and the handshake is paused. Once an SDS response is received with a
  resource, the handshake is resumed with the provided certificate. If the SDS server indicates the
  resource removal, the handshake is failed, and the SDS subscription to the resource is stopped.

  Similar to the regular SDS, the certificate is configured using the outer common TLS context,
  e.g. by setting the FIPS compliance policy on the loaded certificate.
  [#protodoc-title: On-demand secret certificate selector]
  [#extension: envoy.tls.certificate_selectors.on_demand_secret]
  """

  use Protobuf,
    full_name: "envoy.extensions.transport_sockets.tls.cert_selectors.on_demand_secret.v3.Config",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :config_source, 1,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "configSource",
    deprecated: false

  field :certificate_mapper, 2,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "certificateMapper",
    deprecated: false

  field :prefetch_secret_names, 3, repeated: true, type: :string, json_name: "prefetchSecretNames"
end

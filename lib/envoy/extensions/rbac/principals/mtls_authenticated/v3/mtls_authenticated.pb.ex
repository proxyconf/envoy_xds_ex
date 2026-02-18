defmodule Envoy.Extensions.Rbac.Principals.MtlsAuthenticated.V3.Config do
  @moduledoc """
  Authentication attributes for a downstream mTLS connection. All modes require that a peer certificate
  was presented and validated using the ValidationContext in the DownstreamTlsContext configuration.

  If neither field is set, a configuration loading error will be generated. This is so that
  not validating SANs requires an affirmative configuration to disable, to prevent accidentally
  not configuring SAN validation.

  If ``any_validated_client_certificate`` is set in addition to ``san_matcher`` or a future field
  which specifies additional validation, the other field always takes precedence over
  ``any_validated_client_certificate`` and all specified validation is performed.
  [#protodoc-title: RBAC MTls Authenticated Principal]
  [#extension: envoy.rbac.principals.mtls_authenticated]
  """

  use Protobuf,
    full_name: "envoy.extensions.rbac.principals.mtls_authenticated.v3.Config",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :san_matcher, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SubjectAltNameMatcher,
    json_name: "sanMatcher"

  field :any_validated_client_certificate, 2,
    type: :bool,
    json_name: "anyValidatedClientCertificate"
end

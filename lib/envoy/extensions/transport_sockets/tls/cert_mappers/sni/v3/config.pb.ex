defmodule Envoy.Extensions.TransportSockets.Tls.CertMappers.Sni.V3.SNI do
  @moduledoc """
  Uses the SNI value from the TLS client hello as the secret resource name in the downstream selector.
  [#protodoc-title: SNI certificate mapper]
  [#extension: envoy.tls.certificate_mappers.sni]
  """

  use Protobuf,
    full_name: "envoy.extensions.transport_sockets.tls.cert_mappers.sni.v3.SNI",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :default_value, 1, type: :string, json_name: "defaultValue", deprecated: false
end

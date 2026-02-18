defmodule Envoy.Extensions.TransportSockets.Tls.CertMappers.StaticName.V3.StaticName do
  @moduledoc """
  A mapping to a fixed secret name for all certificates.
  [#protodoc-title: Static secret certificate mapper]
  [#extension: envoy.tls.certificate_mappers.static_name]
  """

  use Protobuf,
    full_name: "envoy.extensions.transport_sockets.tls.cert_mappers.static_name.v3.StaticName",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
end

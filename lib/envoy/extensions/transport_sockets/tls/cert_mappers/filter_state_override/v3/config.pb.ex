defmodule Envoy.Extensions.TransportSockets.Tls.CertMappers.FilterStateOverride.V3.Config do
  @moduledoc """
  Uses a filter state value for the key ``envoy.tls.certificate_mappers.on_demand_secret`` as the
  secret resource name. This filter state is expected to be shared from the downstream connection.
  [#protodoc-title: Filter state certificate mapper]
  [#extension: envoy.tls.upstream_certificate_mappers.filter_state_override]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.transport_sockets.tls.cert_mappers.filter_state_override.v3.Config",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :default_value, 1, type: :string, json_name: "defaultValue", deprecated: false
end

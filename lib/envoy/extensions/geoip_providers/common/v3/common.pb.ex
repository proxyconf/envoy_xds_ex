defmodule Envoy.Extensions.GeoipProviders.Common.V3.CommonGeoipProviderConfig.GeolocationHeadersToAdd do
  @moduledoc """
  The set of geolocation headers to add to request. If any of the configured headers is present
  in the incoming request, it will be overridden by the :ref:`Geoip filter <config_http_filters_geoip>`.
  [#next-free-field: 10]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :country, 1, type: :string, deprecated: false
  field :city, 2, type: :string, deprecated: false
  field :region, 3, type: :string, deprecated: false
  field :asn, 4, type: :string, deprecated: false
  field :is_anon, 5, type: :string, json_name: "isAnon", deprecated: false
  field :anon_vpn, 6, type: :string, json_name: "anonVpn", deprecated: false
  field :anon_hosting, 7, type: :string, json_name: "anonHosting", deprecated: false
  field :anon_tor, 8, type: :string, json_name: "anonTor", deprecated: false
  field :anon_proxy, 9, type: :string, json_name: "anonProxy", deprecated: false
end

defmodule Envoy.Extensions.GeoipProviders.Common.V3.CommonGeoipProviderConfig do
  @moduledoc """
  [#protodoc-title: Common Geolocation Provider Configuration]
  Common geolocation provider :ref:`configuration overview <config_geoip_providers_common>`.
  Common configuration shared across geolocation providers.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :geo_headers_to_add, 1,
    type:
      Envoy.Extensions.GeoipProviders.Common.V3.CommonGeoipProviderConfig.GeolocationHeadersToAdd,
    json_name: "geoHeadersToAdd",
    deprecated: false
end

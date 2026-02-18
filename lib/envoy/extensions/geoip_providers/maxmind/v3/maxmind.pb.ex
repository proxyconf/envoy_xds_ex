defmodule Envoy.Extensions.GeoipProviders.Maxmind.V3.MaxMindConfig do
  @moduledoc """
  [#next-free-field: 7]
  [#protodoc-title: MaxMind Geolocation Provider]
  MaxMind geolocation provider :ref:`configuration overview <config_geoip_providers_maxmind>`.

  At least one geolocation database path must be configured:

  * :ref:`city_db_path <envoy_v3_api_field_extensions.geoip_providers.maxmind.v3.MaxMindConfig.city_db_path>`
  * :ref:`isp_db_path <envoy_v3_api_field_extensions.geoip_providers.maxmind.v3.MaxMindConfig.isp_db_path>`
  * :ref:`asn_db_path <envoy_v3_api_field_extensions.geoip_providers.maxmind.v3.MaxMindConfig.asn_db_path>`
  * :ref:`anon_db_path <envoy_v3_api_field_extensions.geoip_providers.maxmind.v3.MaxMindConfig.anon_db_path>`
  * :ref:`country_db_path <envoy_v3_api_field_extensions.geoip_providers.maxmind.v3.MaxMindConfig.country_db_path>`
  [#extension: envoy.geoip_providers.maxmind]
  """

  use Protobuf,
    full_name: "envoy.extensions.geoip_providers.maxmind.v3.MaxMindConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :city_db_path, 1, type: :string, json_name: "cityDbPath", deprecated: false
  field :asn_db_path, 2, type: :string, json_name: "asnDbPath", deprecated: false
  field :anon_db_path, 3, type: :string, json_name: "anonDbPath", deprecated: false
  field :isp_db_path, 5, type: :string, json_name: "ispDbPath", deprecated: false
  field :country_db_path, 6, type: :string, json_name: "countryDbPath", deprecated: false

  field :common_provider_config, 4,
    type: Envoy.Extensions.GeoipProviders.Common.V3.CommonGeoipProviderConfig,
    json_name: "commonProviderConfig",
    deprecated: false
end

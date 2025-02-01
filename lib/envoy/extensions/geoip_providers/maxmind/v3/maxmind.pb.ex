defmodule Envoy.Extensions.GeoipProviders.Maxmind.V3.MaxMindConfig do
  @moduledoc """
  [#protodoc-title: MaxMind Geolocation Provider]
  MaxMind geolocation provider :ref:`configuration overview <config_geoip_providers_maxmind>`.
  At least one geolocation database path :ref:`city_db_path <envoy_v3_api_field_extensions.geoip_providers.maxmind.v3.MaxMindConfig.city_db_path>`,
  :ref:`isp_db_path <envoy_v3_api_field_extensions.geoip_providers.maxmind.v3.MaxMindConfig.isp_db_path>` or
  :ref:`anon_db_path <envoy_v3_api_field_extensions.geoip_providers.maxmind.v3.MaxMindConfig.anon_db_path>` must be configured.
  [#extension: envoy.geoip_providers.maxmind]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :city_db_path, 1, type: :string, json_name: "cityDbPath", deprecated: false
  field :isp_db_path, 2, type: :string, json_name: "ispDbPath", deprecated: false
  field :anon_db_path, 3, type: :string, json_name: "anonDbPath", deprecated: false

  field :common_provider_config, 4,
    type: Envoy.Extensions.GeoipProviders.Common.V3.CommonGeoipProviderConfig,
    json_name: "commonProviderConfig",
    deprecated: false
end

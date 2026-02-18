defmodule Envoy.Extensions.Filters.Network.Geoip.V3.Geoip do
  @moduledoc """
  The network geolocation filter performs IP geolocation lookups on incoming connections
  and stores the results in the connection's filter state under the well-known key
  ``envoy.geoip``. The stored data is a ``GeoipInfo`` object that supports
  serialization for access logging and field-level access.

  See :ref:`well known filter state <well_known_filter_state>` for details on accessing
  the geolocation data.
  [#protodoc-title: Geoip]
  Geoip :ref:`configuration overview <config_network_filters_geoip>`.
  [#extension: envoy.filters.network.geoip]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.geoip.v3.Geoip",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix"
  field :provider, 2, type: Envoy.Config.Core.V3.TypedExtensionConfig, deprecated: false
  field :client_ip, 3, type: :string, json_name: "clientIp"
end

defmodule Envoy.Extensions.Filters.Http.Geoip.V3.Geoip.XffConfig do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.geoip.v3.Geoip.XffConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :xff_num_trusted_hops, 1, type: :uint32, json_name: "xffNumTrustedHops"
end

defmodule Envoy.Extensions.Filters.Http.Geoip.V3.Geoip.CustomHeaderConfig do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.geoip.v3.Geoip.CustomHeaderConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.Geoip.V3.Geoip do
  @moduledoc """
  [#protodoc-title: Geoip]
  Geoip :ref:`configuration overview <config_http_filters_geoip>`.
  [#extension: envoy.filters.http.geoip]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.geoip.v3.Geoip",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :xff_config, 1,
    type: Envoy.Extensions.Filters.Http.Geoip.V3.Geoip.XffConfig,
    json_name: "xffConfig"

  field :custom_header_config, 4,
    type: Envoy.Extensions.Filters.Http.Geoip.V3.Geoip.CustomHeaderConfig,
    json_name: "customHeaderConfig"

  field :provider, 3, type: Envoy.Config.Core.V3.TypedExtensionConfig, deprecated: false
end

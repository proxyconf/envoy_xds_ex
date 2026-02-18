defmodule Envoy.Config.Filter.Network.Echo.V2.Echo do
  @moduledoc """
  [#protodoc-title: Echo]
  Echo :ref:`configuration overview <config_network_filters_echo>`.
  [#extension: envoy.filters.network.echo]
  """

  use Protobuf,
    full_name: "envoy.config.filter.network.echo.v2.Echo",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

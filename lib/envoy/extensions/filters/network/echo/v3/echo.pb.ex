defmodule Envoy.Extensions.Filters.Network.Echo.V3.Echo do
  @moduledoc """
  [#protodoc-title: Echo]
  Echo :ref:`configuration overview <config_network_filters_echo>`.
  [#extension: envoy.filters.network.echo]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.echo.v3.Echo",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

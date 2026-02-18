defmodule Envoy.Extensions.Filters.Network.DirectResponse.V3.Config do
  @moduledoc """
  [#protodoc-title: Direct response]
  Direct response :ref:`configuration overview <config_network_filters_direct_response>`.
  [#extension: envoy.filters.network.direct_response]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.direct_response.v3.Config",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :response, 1, type: Envoy.Config.Core.V3.DataSource
end

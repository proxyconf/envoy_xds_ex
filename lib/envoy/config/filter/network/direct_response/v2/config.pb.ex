defmodule Envoy.Config.Filter.Network.DirectResponse.V2.Config do
  @moduledoc """
  [#protodoc-title: Direct response]
  Direct response :ref:`configuration overview <config_network_filters_direct_response>`.
  [#extension: envoy.filters.network.direct_response]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :response, 1, type: Envoy.Api.V2.Core.DataSource
end

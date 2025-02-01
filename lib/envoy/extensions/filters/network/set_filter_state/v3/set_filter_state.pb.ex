defmodule Envoy.Extensions.Filters.Network.SetFilterState.V3.Config do
  @moduledoc """
  [#protodoc-title: Set-Filter-State Filter]

  This filter sets or updates the dynamic filter state. See :ref:`the filter
  documentation <config_network_filters_set_filter_state>` for more
  information on how this filter should be used.

  [#extension: envoy.filters.network.set_filter_state]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :on_new_connection, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Common.SetFilterState.V3.FilterStateValue,
    json_name: "onNewConnection"
end

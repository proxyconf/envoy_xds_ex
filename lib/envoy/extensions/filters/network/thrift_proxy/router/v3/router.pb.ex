defmodule Envoy.Extensions.Filters.Network.ThriftProxy.Router.V3.Router do
  @moduledoc """
  [#protodoc-title: Router]
  Thrift router :ref:`configuration overview <config_thrift_filters_router>`.
  [#extension: envoy.filters.thrift.router]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :close_downstream_on_upstream_error, 1,
    type: Google.Protobuf.BoolValue,
    json_name: "closeDownstreamOnUpstreamError"
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.Router.V3.Router do
  @moduledoc """
  [#protodoc-title: Router for generic proxy]
  [#extension: envoy.filters.generic.router]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :bind_upstream_connection, 1, type: :bool, json_name: "bindUpstreamConnection"
end

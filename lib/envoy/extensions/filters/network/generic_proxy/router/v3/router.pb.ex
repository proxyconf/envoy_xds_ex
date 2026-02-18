defmodule Envoy.Extensions.Filters.Network.GenericProxy.Router.V3.Router do
  @moduledoc """
  [#protodoc-title: Router for generic proxy]
  [#extension: envoy.filters.generic.router]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.generic_proxy.router.v3.Router",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :bind_upstream_connection, 1, type: :bool, json_name: "bindUpstreamConnection"
end

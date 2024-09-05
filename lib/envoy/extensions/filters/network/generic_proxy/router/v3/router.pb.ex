defmodule Envoy.Extensions.Filters.Network.GenericProxy.Router.V3.Router do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :bind_upstream_connection, 1, type: :bool, json_name: "bindUpstreamConnection"
end
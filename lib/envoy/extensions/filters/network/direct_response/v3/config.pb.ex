defmodule Envoy.Extensions.Filters.Network.DirectResponse.V3.Config do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :response, 1, type: Envoy.Config.Core.V3.DataSource
end
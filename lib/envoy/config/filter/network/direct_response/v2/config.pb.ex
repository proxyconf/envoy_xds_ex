defmodule Envoy.Config.Filter.Network.DirectResponse.V2.Config do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :response, 1, type: Envoy.Api.V2.Core.DataSource
end
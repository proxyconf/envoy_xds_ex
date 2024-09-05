defmodule Envoy.Extensions.ResourceMonitors.InjectedResource.V3.InjectedResourceConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :filename, 1, type: :string, deprecated: false
end
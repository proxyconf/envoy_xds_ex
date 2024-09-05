defmodule Envoy.Config.Listener.V2.ApiListener do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :api_listener, 1, type: Google.Protobuf.Any, json_name: "apiListener"
end
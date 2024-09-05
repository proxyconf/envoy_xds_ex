defmodule Envoy.Extensions.Http.StatefulSession.Header.V3.HeaderBasedSessionState do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
end
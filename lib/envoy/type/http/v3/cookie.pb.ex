defmodule Envoy.Type.Http.V3.Cookie do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :ttl, 2, type: Google.Protobuf.Duration, deprecated: false
  field :path, 3, type: :string
end
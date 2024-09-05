defmodule Envoy.Type.SemanticVersion do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :major_number, 1, type: :uint32, json_name: "majorNumber"
  field :minor_number, 2, type: :uint32, json_name: "minorNumber"
  field :patch, 3, type: :uint32
end
defmodule Envoy.Annotations.ResourceAnnotation do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :type, 1, type: :string
end
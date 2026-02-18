defmodule Envoy.Annotations.ResourceAnnotation do
  use Protobuf,
    full_name: "envoy.annotations.ResourceAnnotation",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :type, 1, type: :string
end

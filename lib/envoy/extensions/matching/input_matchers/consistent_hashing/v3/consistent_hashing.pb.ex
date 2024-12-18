defmodule Envoy.Extensions.Matching.InputMatchers.ConsistentHashing.V3.ConsistentHashing do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :threshold, 1, type: :uint32
  field :modulo, 2, type: :uint32, deprecated: false
  field :seed, 3, type: :uint64
end
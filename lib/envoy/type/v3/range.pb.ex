defmodule Envoy.Type.V3.Int64Range do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :start, 1, type: :int64
  field :end, 2, type: :int64
end

defmodule Envoy.Type.V3.Int32Range do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :start, 1, type: :int32
  field :end, 2, type: :int32
end

defmodule Envoy.Type.V3.DoubleRange do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :start, 1, type: :double
  field :end, 2, type: :double
end
defmodule Envoy.Admin.V3.SimpleMetric.Type do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :COUNTER, 0
  field :GAUGE, 1
end

defmodule Envoy.Admin.V3.SimpleMetric do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :type, 1, type: Envoy.Admin.V3.SimpleMetric.Type, enum: true
  field :value, 2, type: :uint64
  field :name, 3, type: :string
end
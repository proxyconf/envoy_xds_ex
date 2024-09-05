defmodule Envoy.Type.FractionalPercent.DenominatorType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :HUNDRED, 0
  field :TEN_THOUSAND, 1
  field :MILLION, 2
end

defmodule Envoy.Type.Percent do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :value, 1, type: :double, deprecated: false
end

defmodule Envoy.Type.FractionalPercent do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :numerator, 1, type: :uint32

  field :denominator, 2,
    type: Envoy.Type.FractionalPercent.DenominatorType,
    enum: true,
    deprecated: false
end
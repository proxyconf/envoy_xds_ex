defmodule Envoy.Type.FractionalPercent.DenominatorType do
  @moduledoc """
  Fraction percentages support several fixed denominator values.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :HUNDRED, 0
  field :TEN_THOUSAND, 1
  field :MILLION, 2
end

defmodule Envoy.Type.Percent do
  @moduledoc """
  Identifies a percentage, in the range [0.0, 100.0].
  [#protodoc-title: Percent]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :value, 1, type: :double, deprecated: false
end

defmodule Envoy.Type.FractionalPercent do
  @moduledoc """
  A fractional percentage is used in cases in which for performance reasons performing floating
  point to integer conversions during randomness calculations is undesirable. The message includes
  both a numerator and denominator that together determine the final fractional value.

  * **Example**: 1/100 = 1%.
  * **Example**: 3/10000 = 0.03%.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :numerator, 1, type: :uint32

  field :denominator, 2,
    type: Envoy.Type.FractionalPercent.DenominatorType,
    enum: true,
    deprecated: false
end

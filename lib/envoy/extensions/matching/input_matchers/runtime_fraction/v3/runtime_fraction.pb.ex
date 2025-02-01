defmodule Envoy.Extensions.Matching.InputMatchers.RuntimeFraction.V3.RuntimeFraction do
  @moduledoc """
  The runtime fraction matchers computes a hash from the input and matches if runtime feature is enabled
  for the the resulting hash. Every time the input is considered for a match, its hash must fall within
  the percentage of matches indicated by this field. For a fraction N/D, a number is computed as a hash
  of the input on a field in the range [0,D). If the number is less than or equal to the value of the
  numerator N, the matcher evaluates to true. A runtime_fraction input matcher can be used to gradually
  roll out matcher changes without requiring full code or configuration deployments.
  Note that distribution of matching results is only as good as one of the input.
  [#protodoc-title: Runtime matcher]
  [#extension: envoy.matching.matchers.runtime_fraction]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :runtime_fraction, 1,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "runtimeFraction",
    deprecated: false

  field :seed, 2, type: :uint64
end

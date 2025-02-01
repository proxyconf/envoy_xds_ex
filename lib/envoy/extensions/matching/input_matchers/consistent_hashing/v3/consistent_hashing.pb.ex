defmodule Envoy.Extensions.Matching.InputMatchers.ConsistentHashing.V3.ConsistentHashing do
  @moduledoc """
  The consistent hashing matchers computes a consistent hash from the input and matches if the resulting hash
  is within the configured threshold.
  More specifically, this matcher evaluates to true if hash(input, seed) % modulo >= threshold.
  Note that the consistency of the match result relies on the internal hash function (xxhash) remaining
  unchanged. While this is unlikely to happen intentionally, this could cause inconsistent match results
  between deployments.
  [#protodoc-title: Consistent hashing matcher]
  [#extension: envoy.matching.matchers.consistent_hashing]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :threshold, 1, type: :uint32
  field :modulo, 2, type: :uint32, deprecated: false
  field :seed, 3, type: :uint64
end

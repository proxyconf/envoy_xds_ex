defmodule Envoy.Extensions.Matching.InputMatchers.Metadata.V3.Metadata do
  @moduledoc """
  Metadata matcher for metadata from http matching input data.
  [#protodoc-title: metadata matcher]
  [#extension: envoy.matching.matchers.metadata_matcher]
  """

  use Protobuf,
    full_name: "envoy.extensions.matching.input_matchers.metadata.v3.Metadata",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :value, 1, type: Envoy.Type.Matcher.V3.ValueMatcher, deprecated: false
  field :invert, 4, type: :bool
end

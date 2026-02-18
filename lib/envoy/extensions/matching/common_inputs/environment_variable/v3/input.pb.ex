defmodule Envoy.Extensions.Matching.CommonInputs.EnvironmentVariable.V3.Config do
  @moduledoc """
  Reads an environment variable to provide an input for matching.
  [#protodoc-title: Environment variable input]
  [#extension: envoy.matching.common_inputs.environment_variable]
  """

  use Protobuf,
    full_name: "envoy.extensions.matching.common_inputs.environment_variable.v3.Config",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
end

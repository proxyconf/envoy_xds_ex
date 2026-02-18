defmodule Envoy.Extensions.Tracers.Opentelemetry.Samplers.V3.CELSamplerConfig do
  @moduledoc """
  [#protodoc-title: "CEL" Sampler config]
  Configuration for the "CEL" Sampler extension.

  [#extension: envoy.tracers.opentelemetry.samplers.cel]
  """

  use Protobuf,
    full_name: "envoy.extensions.tracers.opentelemetry.samplers.v3.CELSamplerConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :expression, 1, type: Xds.Type.V3.CelExpression, deprecated: false
end

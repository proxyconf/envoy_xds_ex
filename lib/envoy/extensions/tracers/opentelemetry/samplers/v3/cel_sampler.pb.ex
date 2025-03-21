defmodule Envoy.Extensions.Tracers.Opentelemetry.Samplers.V3.CELSamplerConfig do
  @moduledoc """
  [#protodoc-title: "CEL" Sampler config]
  Configuration for the "CEL" Sampler extension.

  [#extension: envoy.tracers.opentelemetry.samplers.cel]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :expression, 1, type: Xds.Type.V3.CelExpression, deprecated: false
end

defmodule Envoy.Extensions.Tracers.Opentelemetry.Samplers.V3.ParentBasedSamplerConfig do
  @moduledoc """
  [#protodoc-title: Parent Based Sampler config]
  Configuration for the "ParentBased" Sampler extension.
  The sampler follows the "ParentBased" implementation from the OpenTelemetry
  SDK specification.

  See:
  `ParentBased sampler specification <https://opentelemetry.io/docs/specs/otel/trace/sdk/#parentbased>`_
  [#extension: envoy.tracers.opentelemetry.samplers.parent_based]
  """

  use Protobuf,
    full_name: "envoy.extensions.tracers.opentelemetry.samplers.v3.ParentBasedSamplerConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :wrapped_sampler, 1,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "wrappedSampler"
end

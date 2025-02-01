defmodule Envoy.Extensions.Tracers.Opentelemetry.Samplers.V3.AlwaysOnSamplerConfig do
  @moduledoc """
  [#protodoc-title: Always On Sampler config]
  Configuration for the "AlwaysOn" Sampler extension.
  The sampler follows the "AlwaysOn" implementation from the OpenTelemetry
  SDK specification.

  See:
  `AlwaysOn sampler specification <https://opentelemetry.io/docs/specs/otel/trace/sdk/#alwayson>`_
  [#extension: envoy.tracers.opentelemetry.samplers.always_on]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Tracers.Opentelemetry.Samplers.V3.TraceIdRatioBasedSamplerConfig do
  @moduledoc """
  [#protodoc-title: Trace Id Ratio Based Sampler config]
  Configuration for the "TraceIdRatioBased" Sampler extension.
  The sampler follows the "TraceIdRatioBased" implementation from the OpenTelemetry
  SDK specification.

  See:
  `TraceIdRatioBased sampler specification <https://opentelemetry.io/docs/specs/otel/trace/sdk/#traceidratiobased>`_
  [#extension: envoy.tracers.opentelemetry.samplers.trace_id_ratio_based]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.tracers.opentelemetry.samplers.v3.TraceIdRatioBasedSamplerConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :sampling_percentage, 1,
    type: Envoy.Type.V3.FractionalPercent,
    json_name: "samplingPercentage"
end

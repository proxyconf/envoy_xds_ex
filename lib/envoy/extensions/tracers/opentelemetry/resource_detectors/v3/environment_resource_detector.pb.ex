defmodule Envoy.Extensions.Tracers.Opentelemetry.ResourceDetectors.V3.EnvironmentResourceDetectorConfig do
  @moduledoc """
  Configuration for the Environment Resource detector extension.
  The resource detector reads from the ``OTEL_RESOURCE_ATTRIBUTES``
  environment variable, as per the OpenTelemetry specification.

  See:

  `OpenTelemetry specification <https://github.com/open-telemetry/opentelemetry-specification/blob/v1.24.0/specification/resource/sdk.md#detecting-resource-information-from-the-environment>`_

  [#extension: envoy.tracers.opentelemetry.resource_detectors.environment]
  [#protodoc-title: Environment Resource Detector config]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

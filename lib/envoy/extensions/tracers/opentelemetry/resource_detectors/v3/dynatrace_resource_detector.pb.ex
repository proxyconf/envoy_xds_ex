defmodule Envoy.Extensions.Tracers.Opentelemetry.ResourceDetectors.V3.DynatraceResourceDetectorConfig do
  @moduledoc """
  Configuration for the Dynatrace Resource Detector extension.
  The resource detector reads from the Dynatrace enrichment files
  and adds host/process related attributes to the OpenTelemetry resource.

  See:

  `Enrich ingested data with Dynatrace-specific dimensions <https://docs.dynatrace.com/docs/shortlink/enrichment-files>`_

  [#extension: envoy.tracers.opentelemetry.resource_detectors.dynatrace]
  [#protodoc-title: Dynatrace Resource Detector config]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

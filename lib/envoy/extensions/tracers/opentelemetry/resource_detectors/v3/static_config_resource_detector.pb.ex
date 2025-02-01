defmodule Envoy.Extensions.Tracers.Opentelemetry.ResourceDetectors.V3.StaticConfigResourceDetectorConfig.AttributesEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Extensions.Tracers.Opentelemetry.ResourceDetectors.V3.StaticConfigResourceDetectorConfig do
  @moduledoc """
  Configuration for the Static Resource detector extension.
  The resource detector uses static config for resource attribute,
  as per the OpenTelemetry specification.

  [#extension: envoy.tracers.opentelemetry.resource_detectors.static_config]
  [#protodoc-title: Static Config Resource Detector config]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :attributes, 1,
    repeated: true,
    type:
      Envoy.Extensions.Tracers.Opentelemetry.ResourceDetectors.V3.StaticConfigResourceDetectorConfig.AttributesEntry,
    map: true
end

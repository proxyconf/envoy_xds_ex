defmodule Envoy.Config.Trace.V3.OpenTelemetryConfig do
  @moduledoc """
  Configuration for the OpenTelemetry tracer.
   [#extension: envoy.tracers.opentelemetry]
  [#next-free-field: 7]
  [#protodoc-title: OpenTelemetry tracer]
  """

  use Protobuf,
    full_name: "envoy.config.trace.v3.OpenTelemetryConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :grpc_service, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    deprecated: false

  field :http_service, 3,
    type: Envoy.Config.Core.V3.HttpService,
    json_name: "httpService",
    deprecated: false

  field :service_name, 2, type: :string, json_name: "serviceName"

  field :resource_detectors, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "resourceDetectors"

  field :sampler, 5, type: Envoy.Config.Core.V3.TypedExtensionConfig
  field :max_cache_size, 6, type: Google.Protobuf.UInt32Value, json_name: "maxCacheSize"
end

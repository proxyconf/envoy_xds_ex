defmodule Envoy.Config.Metrics.V2.MetricsServiceConfig do
  @moduledoc """
  Metrics Service is configured as a built-in *envoy.stat_sinks.metrics_service* :ref:`StatsSink
  <envoy_api_msg_config.metrics.v2.StatsSink>`. This opaque configuration will be used to create
  Metrics Service.
  [#extension: envoy.stat_sinks.metrics_service]
  [#protodoc-title: Metrics service]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :grpc_service, 1,
    type: Envoy.Api.V2.Core.GrpcService,
    json_name: "grpcService",
    deprecated: false
end

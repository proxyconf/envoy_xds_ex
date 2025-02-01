defmodule Envoy.Config.Trace.V3.SkyWalkingConfig do
  @moduledoc """
  Configuration for the SkyWalking tracer. Please note that if SkyWalking tracer is used as the
  provider of tracing, then
  :ref:`spawn_upstream_span <envoy_v3_api_field_extensions.filters.network.http_connection_manager.v3.HttpConnectionManager.Tracing.spawn_upstream_span>`
  in the tracing config must be set to true to get the correct topology and tracing data. Moreover, SkyWalking
  Tracer does not support SkyWalking extension header (``sw8-x``) temporarily.
  [#extension: envoy.tracers.skywalking]
  [#protodoc-title: SkyWalking tracer]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :grpc_service, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    deprecated: false

  field :client_config, 2, type: Envoy.Config.Trace.V3.ClientConfig, json_name: "clientConfig"
end

defmodule Envoy.Config.Trace.V3.ClientConfig do
  @moduledoc """
  Client config for SkyWalking tracer.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :backend_token_specifier, 0

  field :service_name, 1, type: :string, json_name: "serviceName"
  field :instance_name, 2, type: :string, json_name: "instanceName"
  field :backend_token, 3, type: :string, json_name: "backendToken", oneof: 0, deprecated: false
  field :max_cache_size, 4, type: Google.Protobuf.UInt32Value, json_name: "maxCacheSize"
end

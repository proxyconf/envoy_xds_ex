defmodule Envoy.Api.V2.Core.HealthStatus do
  @moduledoc """
  Endpoint health status.
  [#protodoc-title: Health check]
  * Health checking :ref:`architecture overview <arch_overview_health_checking>`.
  * If health checking is configured for a cluster, additional statistics are emitted. They are
  documented :ref:`here <config_cluster_manager_cluster_stats>`.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNKNOWN, 0
  field :HEALTHY, 1
  field :UNHEALTHY, 2
  field :DRAINING, 3
  field :TIMEOUT, 4
  field :DEGRADED, 5
end

defmodule Envoy.Api.V2.Core.HealthCheck.Payload do
  @moduledoc """
  Describes the encoding of the payload bytes in the payload.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :payload, 0

  field :text, 1, type: :string, oneof: 0, deprecated: false
  field :binary, 2, type: :bytes, oneof: 0
end

defmodule Envoy.Api.V2.Core.HealthCheck.HttpHealthCheck do
  @moduledoc """
  [#next-free-field: 12]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :host, 1, type: :string
  field :path, 2, type: :string, deprecated: false
  field :send, 3, type: Envoy.Api.V2.Core.HealthCheck.Payload
  field :receive, 4, type: Envoy.Api.V2.Core.HealthCheck.Payload
  field :service_name, 5, type: :string, json_name: "serviceName", deprecated: true

  field :request_headers_to_add, 6,
    repeated: true,
    type: Envoy.Api.V2.Core.HeaderValueOption,
    json_name: "requestHeadersToAdd",
    deprecated: false

  field :request_headers_to_remove, 8,
    repeated: true,
    type: :string,
    json_name: "requestHeadersToRemove"

  field :use_http2, 7, type: :bool, json_name: "useHttp2", deprecated: true

  field :expected_statuses, 9,
    repeated: true,
    type: Envoy.Type.Int64Range,
    json_name: "expectedStatuses"

  field :codec_client_type, 10,
    type: Envoy.Type.CodecClientType,
    json_name: "codecClientType",
    enum: true,
    deprecated: false

  field :service_name_matcher, 11,
    type: Envoy.Type.Matcher.StringMatcher,
    json_name: "serviceNameMatcher"
end

defmodule Envoy.Api.V2.Core.HealthCheck.TcpHealthCheck do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :send, 1, type: Envoy.Api.V2.Core.HealthCheck.Payload
  field :receive, 2, repeated: true, type: Envoy.Api.V2.Core.HealthCheck.Payload
end

defmodule Envoy.Api.V2.Core.HealthCheck.RedisHealthCheck do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
end

defmodule Envoy.Api.V2.Core.HealthCheck.GrpcHealthCheck do
  @moduledoc """
  `grpc.health.v1.Health
  <https://github.com/grpc/grpc/blob/master/src/proto/grpc/health/v1/health.proto>`_-based
  healthcheck. See `gRPC doc <https://github.com/grpc/grpc/blob/master/doc/health-checking.md>`_
  for details.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :service_name, 1, type: :string, json_name: "serviceName"
  field :authority, 2, type: :string
end

defmodule Envoy.Api.V2.Core.HealthCheck.CustomHealthCheck do
  @moduledoc """
  Custom health check.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Api.V2.Core.HealthCheck.TlsOptions do
  @moduledoc """
  Health checks occur over the transport socket specified for the cluster. This implies that if a
  cluster is using a TLS-enabled transport socket, the health check will also occur over TLS.

  This allows overriding the cluster TLS settings, just for health check connections.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :alpn_protocols, 1, repeated: true, type: :string, json_name: "alpnProtocols"
end

defmodule Envoy.Api.V2.Core.HealthCheck do
  @moduledoc """
  [#next-free-field: 23]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :health_checker, 0

  field :timeout, 1, type: Google.Protobuf.Duration, deprecated: false
  field :interval, 2, type: Google.Protobuf.Duration, deprecated: false
  field :initial_jitter, 20, type: Google.Protobuf.Duration, json_name: "initialJitter"
  field :interval_jitter, 3, type: Google.Protobuf.Duration, json_name: "intervalJitter"
  field :interval_jitter_percent, 18, type: :uint32, json_name: "intervalJitterPercent"

  field :unhealthy_threshold, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "unhealthyThreshold",
    deprecated: false

  field :healthy_threshold, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "healthyThreshold",
    deprecated: false

  field :alt_port, 6, type: Google.Protobuf.UInt32Value, json_name: "altPort"
  field :reuse_connection, 7, type: Google.Protobuf.BoolValue, json_name: "reuseConnection"

  field :http_health_check, 8,
    type: Envoy.Api.V2.Core.HealthCheck.HttpHealthCheck,
    json_name: "httpHealthCheck",
    oneof: 0

  field :tcp_health_check, 9,
    type: Envoy.Api.V2.Core.HealthCheck.TcpHealthCheck,
    json_name: "tcpHealthCheck",
    oneof: 0

  field :grpc_health_check, 11,
    type: Envoy.Api.V2.Core.HealthCheck.GrpcHealthCheck,
    json_name: "grpcHealthCheck",
    oneof: 0

  field :custom_health_check, 13,
    type: Envoy.Api.V2.Core.HealthCheck.CustomHealthCheck,
    json_name: "customHealthCheck",
    oneof: 0

  field :no_traffic_interval, 12,
    type: Google.Protobuf.Duration,
    json_name: "noTrafficInterval",
    deprecated: false

  field :unhealthy_interval, 14,
    type: Google.Protobuf.Duration,
    json_name: "unhealthyInterval",
    deprecated: false

  field :unhealthy_edge_interval, 15,
    type: Google.Protobuf.Duration,
    json_name: "unhealthyEdgeInterval",
    deprecated: false

  field :healthy_edge_interval, 16,
    type: Google.Protobuf.Duration,
    json_name: "healthyEdgeInterval",
    deprecated: false

  field :event_log_path, 17, type: :string, json_name: "eventLogPath"
  field :event_service, 22, type: Envoy.Api.V2.Core.EventServiceConfig, json_name: "eventService"

  field :always_log_health_check_failures, 19,
    type: :bool,
    json_name: "alwaysLogHealthCheckFailures"

  field :tls_options, 21, type: Envoy.Api.V2.Core.HealthCheck.TlsOptions, json_name: "tlsOptions"
end

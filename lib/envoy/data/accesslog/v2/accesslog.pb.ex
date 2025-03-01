defmodule Envoy.Data.Accesslog.V2.HTTPAccessLogEntry.HTTPVersion do
  @moduledoc """
  HTTP version
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :PROTOCOL_UNSPECIFIED, 0
  field :HTTP10, 1
  field :HTTP11, 2
  field :HTTP2, 3
  field :HTTP3, 4
end

defmodule Envoy.Data.Accesslog.V2.ResponseFlags.Unauthorized.Reason do
  @moduledoc """
  Reasons why the request was unauthorized
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :REASON_UNSPECIFIED, 0
  field :EXTERNAL_SERVICE, 1
end

defmodule Envoy.Data.Accesslog.V2.TLSProperties.TLSVersion do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :VERSION_UNSPECIFIED, 0
  field :TLSv1, 1
  field :TLSv1_1, 2
  field :TLSv1_2, 3
  field :TLSv1_3, 4
end

defmodule Envoy.Data.Accesslog.V2.TCPAccessLogEntry do
  @moduledoc """
  [#protodoc-title: gRPC access logs]
  Envoy access logs describe incoming interaction with Envoy over a fixed
  period of time, and typically cover a single request/response exchange,
  (e.g. HTTP), stream (e.g. over HTTP/gRPC), or proxied connection (e.g. TCP).
  Access logs contain fields defined in protocol-specific protobuf messages.

  Except where explicitly declared otherwise, all fields describe
  *downstream* interaction between Envoy and a connected client.
  Fields describing *upstream* interaction will explicitly include ``upstream``
  in their name.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :common_properties, 1,
    type: Envoy.Data.Accesslog.V2.AccessLogCommon,
    json_name: "commonProperties"

  field :connection_properties, 2,
    type: Envoy.Data.Accesslog.V2.ConnectionProperties,
    json_name: "connectionProperties"
end

defmodule Envoy.Data.Accesslog.V2.HTTPAccessLogEntry do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :common_properties, 1,
    type: Envoy.Data.Accesslog.V2.AccessLogCommon,
    json_name: "commonProperties"

  field :protocol_version, 2,
    type: Envoy.Data.Accesslog.V2.HTTPAccessLogEntry.HTTPVersion,
    json_name: "protocolVersion",
    enum: true

  field :request, 3, type: Envoy.Data.Accesslog.V2.HTTPRequestProperties
  field :response, 4, type: Envoy.Data.Accesslog.V2.HTTPResponseProperties
end

defmodule Envoy.Data.Accesslog.V2.ConnectionProperties do
  @moduledoc """
  Defines fields for a connection
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :received_bytes, 1, type: :uint64, json_name: "receivedBytes"
  field :sent_bytes, 2, type: :uint64, json_name: "sentBytes"
end

defmodule Envoy.Data.Accesslog.V2.AccessLogCommon.FilterStateObjectsEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Data.Accesslog.V2.AccessLogCommon do
  @moduledoc """
  Defines fields that are shared by all Envoy access logs.
  [#next-free-field: 22]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :sample_rate, 1, type: :double, json_name: "sampleRate", deprecated: false

  field :downstream_remote_address, 2,
    type: Envoy.Api.V2.Core.Address,
    json_name: "downstreamRemoteAddress"

  field :downstream_local_address, 3,
    type: Envoy.Api.V2.Core.Address,
    json_name: "downstreamLocalAddress"

  field :tls_properties, 4,
    type: Envoy.Data.Accesslog.V2.TLSProperties,
    json_name: "tlsProperties"

  field :start_time, 5, type: Google.Protobuf.Timestamp, json_name: "startTime"
  field :time_to_last_rx_byte, 6, type: Google.Protobuf.Duration, json_name: "timeToLastRxByte"

  field :time_to_first_upstream_tx_byte, 7,
    type: Google.Protobuf.Duration,
    json_name: "timeToFirstUpstreamTxByte"

  field :time_to_last_upstream_tx_byte, 8,
    type: Google.Protobuf.Duration,
    json_name: "timeToLastUpstreamTxByte"

  field :time_to_first_upstream_rx_byte, 9,
    type: Google.Protobuf.Duration,
    json_name: "timeToFirstUpstreamRxByte"

  field :time_to_last_upstream_rx_byte, 10,
    type: Google.Protobuf.Duration,
    json_name: "timeToLastUpstreamRxByte"

  field :time_to_first_downstream_tx_byte, 11,
    type: Google.Protobuf.Duration,
    json_name: "timeToFirstDownstreamTxByte"

  field :time_to_last_downstream_tx_byte, 12,
    type: Google.Protobuf.Duration,
    json_name: "timeToLastDownstreamTxByte"

  field :upstream_remote_address, 13,
    type: Envoy.Api.V2.Core.Address,
    json_name: "upstreamRemoteAddress"

  field :upstream_local_address, 14,
    type: Envoy.Api.V2.Core.Address,
    json_name: "upstreamLocalAddress"

  field :upstream_cluster, 15, type: :string, json_name: "upstreamCluster"

  field :response_flags, 16,
    type: Envoy.Data.Accesslog.V2.ResponseFlags,
    json_name: "responseFlags"

  field :metadata, 17, type: Envoy.Api.V2.Core.Metadata

  field :upstream_transport_failure_reason, 18,
    type: :string,
    json_name: "upstreamTransportFailureReason"

  field :route_name, 19, type: :string, json_name: "routeName"

  field :downstream_direct_remote_address, 20,
    type: Envoy.Api.V2.Core.Address,
    json_name: "downstreamDirectRemoteAddress"

  field :filter_state_objects, 21,
    repeated: true,
    type: Envoy.Data.Accesslog.V2.AccessLogCommon.FilterStateObjectsEntry,
    json_name: "filterStateObjects",
    map: true
end

defmodule Envoy.Data.Accesslog.V2.ResponseFlags.Unauthorized do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :reason, 1, type: Envoy.Data.Accesslog.V2.ResponseFlags.Unauthorized.Reason, enum: true
end

defmodule Envoy.Data.Accesslog.V2.ResponseFlags do
  @moduledoc """
  Flags indicating occurrences during request/response processing.
  [#next-free-field: 20]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :failed_local_healthcheck, 1, type: :bool, json_name: "failedLocalHealthcheck"
  field :no_healthy_upstream, 2, type: :bool, json_name: "noHealthyUpstream"
  field :upstream_request_timeout, 3, type: :bool, json_name: "upstreamRequestTimeout"
  field :local_reset, 4, type: :bool, json_name: "localReset"
  field :upstream_remote_reset, 5, type: :bool, json_name: "upstreamRemoteReset"
  field :upstream_connection_failure, 6, type: :bool, json_name: "upstreamConnectionFailure"

  field :upstream_connection_termination, 7,
    type: :bool,
    json_name: "upstreamConnectionTermination"

  field :upstream_overflow, 8, type: :bool, json_name: "upstreamOverflow"
  field :no_route_found, 9, type: :bool, json_name: "noRouteFound"
  field :delay_injected, 10, type: :bool, json_name: "delayInjected"
  field :fault_injected, 11, type: :bool, json_name: "faultInjected"
  field :rate_limited, 12, type: :bool, json_name: "rateLimited"

  field :unauthorized_details, 13,
    type: Envoy.Data.Accesslog.V2.ResponseFlags.Unauthorized,
    json_name: "unauthorizedDetails"

  field :rate_limit_service_error, 14, type: :bool, json_name: "rateLimitServiceError"

  field :downstream_connection_termination, 15,
    type: :bool,
    json_name: "downstreamConnectionTermination"

  field :upstream_retry_limit_exceeded, 16, type: :bool, json_name: "upstreamRetryLimitExceeded"
  field :stream_idle_timeout, 17, type: :bool, json_name: "streamIdleTimeout"
  field :invalid_envoy_request_headers, 18, type: :bool, json_name: "invalidEnvoyRequestHeaders"
  field :downstream_protocol_error, 19, type: :bool, json_name: "downstreamProtocolError"
end

defmodule Envoy.Data.Accesslog.V2.TLSProperties.CertificateProperties.SubjectAltName do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :san, 0

  field :uri, 1, type: :string, oneof: 0
  field :dns, 2, type: :string, oneof: 0
end

defmodule Envoy.Data.Accesslog.V2.TLSProperties.CertificateProperties do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :subject_alt_name, 1,
    repeated: true,
    type: Envoy.Data.Accesslog.V2.TLSProperties.CertificateProperties.SubjectAltName,
    json_name: "subjectAltName"

  field :subject, 2, type: :string
end

defmodule Envoy.Data.Accesslog.V2.TLSProperties do
  @moduledoc """
  Properties of a negotiated TLS connection.
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :tls_version, 1,
    type: Envoy.Data.Accesslog.V2.TLSProperties.TLSVersion,
    json_name: "tlsVersion",
    enum: true

  field :tls_cipher_suite, 2, type: Google.Protobuf.UInt32Value, json_name: "tlsCipherSuite"
  field :tls_sni_hostname, 3, type: :string, json_name: "tlsSniHostname"

  field :local_certificate_properties, 4,
    type: Envoy.Data.Accesslog.V2.TLSProperties.CertificateProperties,
    json_name: "localCertificateProperties"

  field :peer_certificate_properties, 5,
    type: Envoy.Data.Accesslog.V2.TLSProperties.CertificateProperties,
    json_name: "peerCertificateProperties"

  field :tls_session_id, 6, type: :string, json_name: "tlsSessionId"
end

defmodule Envoy.Data.Accesslog.V2.HTTPRequestProperties.RequestHeadersEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Data.Accesslog.V2.HTTPRequestProperties do
  @moduledoc """
  [#next-free-field: 14]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :request_method, 1,
    type: Envoy.Api.V2.Core.RequestMethod,
    json_name: "requestMethod",
    enum: true,
    deprecated: false

  field :scheme, 2, type: :string
  field :authority, 3, type: :string
  field :port, 4, type: Google.Protobuf.UInt32Value
  field :path, 5, type: :string
  field :user_agent, 6, type: :string, json_name: "userAgent"
  field :referer, 7, type: :string
  field :forwarded_for, 8, type: :string, json_name: "forwardedFor"
  field :request_id, 9, type: :string, json_name: "requestId"
  field :original_path, 10, type: :string, json_name: "originalPath"
  field :request_headers_bytes, 11, type: :uint64, json_name: "requestHeadersBytes"
  field :request_body_bytes, 12, type: :uint64, json_name: "requestBodyBytes"

  field :request_headers, 13,
    repeated: true,
    type: Envoy.Data.Accesslog.V2.HTTPRequestProperties.RequestHeadersEntry,
    json_name: "requestHeaders",
    map: true
end

defmodule Envoy.Data.Accesslog.V2.HTTPResponseProperties.ResponseHeadersEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Data.Accesslog.V2.HTTPResponseProperties.ResponseTrailersEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Data.Accesslog.V2.HTTPResponseProperties do
  @moduledoc """
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :response_code, 1, type: Google.Protobuf.UInt32Value, json_name: "responseCode"
  field :response_headers_bytes, 2, type: :uint64, json_name: "responseHeadersBytes"
  field :response_body_bytes, 3, type: :uint64, json_name: "responseBodyBytes"

  field :response_headers, 4,
    repeated: true,
    type: Envoy.Data.Accesslog.V2.HTTPResponseProperties.ResponseHeadersEntry,
    json_name: "responseHeaders",
    map: true

  field :response_trailers, 5,
    repeated: true,
    type: Envoy.Data.Accesslog.V2.HTTPResponseProperties.ResponseTrailersEntry,
    json_name: "responseTrailers",
    map: true

  field :response_code_details, 6, type: :string, json_name: "responseCodeDetails"
end

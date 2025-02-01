defmodule Envoy.Config.Core.V3.HttpProtocolOptions.HeadersWithUnderscoresAction do
  @moduledoc """
  Action to take when Envoy receives client request with header names containing underscore
  characters.
  Underscore character is allowed in header names by the RFC-7230 and this behavior is implemented
  as a security measure due to systems that treat '_' and '-' as interchangeable. Envoy by default allows client request headers with underscore
  characters.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ALLOW, 0
  field :REJECT_REQUEST, 1
  field :DROP_HEADER, 2
end

defmodule Envoy.Config.Core.V3.TcpProtocolOptions do
  @moduledoc """
  [#not-implemented-hide:]
  [#protodoc-title: Protocol options]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Config.Core.V3.QuicKeepAliveSettings do
  @moduledoc """
  Config for keepalive probes in a QUIC connection.
  Note that QUIC keep-alive probing packets work differently from HTTP/2 keep-alive PINGs in a sense that the probing packet
  itself doesn't timeout waiting for a probing response. Quic has a shorter idle timeout than TCP, so it doesn't rely on such probing to discover dead connections. If the peer fails to respond, the connection will idle timeout eventually. Thus, they are configured differently from :ref:`connection_keepalive <envoy_v3_api_field_config.core.v3.Http2ProtocolOptions.connection_keepalive>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :max_interval, 1, type: Google.Protobuf.Duration, json_name: "maxInterval"

  field :initial_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "initialInterval",
    deprecated: false
end

defmodule Envoy.Config.Core.V3.QuicProtocolOptions do
  @moduledoc """
  QUIC protocol options which apply to both downstream and upstream connections.
  [#next-free-field: 10]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :max_concurrent_streams, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConcurrentStreams",
    deprecated: false

  field :initial_stream_window_size, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "initialStreamWindowSize",
    deprecated: false

  field :initial_connection_window_size, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "initialConnectionWindowSize",
    deprecated: false

  field :num_timeouts_to_trigger_port_migration, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "numTimeoutsToTriggerPortMigration",
    deprecated: false

  field :connection_keepalive, 5,
    type: Envoy.Config.Core.V3.QuicKeepAliveSettings,
    json_name: "connectionKeepalive"

  field :connection_options, 6, type: :string, json_name: "connectionOptions"
  field :client_connection_options, 7, type: :string, json_name: "clientConnectionOptions"

  field :idle_network_timeout, 8,
    type: Google.Protobuf.Duration,
    json_name: "idleNetworkTimeout",
    deprecated: false

  field :max_packet_length, 9, type: Google.Protobuf.UInt64Value, json_name: "maxPacketLength"
end

defmodule Envoy.Config.Core.V3.UpstreamHttpProtocolOptions do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :auto_sni, 1, type: :bool, json_name: "autoSni"
  field :auto_san_validation, 2, type: :bool, json_name: "autoSanValidation"

  field :override_auto_sni_header, 3,
    type: :string,
    json_name: "overrideAutoSniHeader",
    deprecated: false
end

defmodule Envoy.Config.Core.V3.AlternateProtocolsCacheOptions.AlternateProtocolsCacheEntry do
  @moduledoc """
  Allows pre-populating the cache with HTTP/3 alternate protocols entries with a 7 day lifetime.
  This will cause Envoy to attempt HTTP/3 to those upstreams, even if the upstreams have not
  advertised HTTP/3 support. These entries will be overwritten by alt-svc
  response headers or cached values.
  As with regular cached entries, if the origin response would result in clearing an existing
  alternate protocol cache entry, pre-populated entries will also be cleared.
  Adding a cache entry with hostname=foo.com port=123 is the equivalent of getting
  response headers
  alt-svc: h3=:"123"; ma=86400" in a response to a request to foo.com:123
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :hostname, 1, type: :string, deprecated: false
  field :port, 2, type: :uint32, deprecated: false
end

defmodule Envoy.Config.Core.V3.AlternateProtocolsCacheOptions do
  @moduledoc """
  Configures the alternate protocols cache which tracks alternate protocols that can be used to
  make an HTTP connection to an origin server. See https://tools.ietf.org/html/rfc7838 for
  HTTP Alternative Services and https://datatracker.ietf.org/doc/html/draft-ietf-dnsop-svcb-https-04
  for the "HTTPS" DNS resource record.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false

  field :max_entries, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxEntries",
    deprecated: false

  field :key_value_store_config, 3,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "keyValueStoreConfig"

  field :prepopulated_entries, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.AlternateProtocolsCacheOptions.AlternateProtocolsCacheEntry,
    json_name: "prepopulatedEntries"

  field :canonical_suffixes, 5, repeated: true, type: :string, json_name: "canonicalSuffixes"
end

defmodule Envoy.Config.Core.V3.HttpProtocolOptions do
  @moduledoc """
  [#next-free-field: 8]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :idle_timeout, 1, type: Google.Protobuf.Duration, json_name: "idleTimeout"

  field :max_connection_duration, 3,
    type: Google.Protobuf.Duration,
    json_name: "maxConnectionDuration"

  field :max_headers_count, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxHeadersCount",
    deprecated: false

  field :max_response_headers_kb, 7,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxResponseHeadersKb",
    deprecated: false

  field :max_stream_duration, 4, type: Google.Protobuf.Duration, json_name: "maxStreamDuration"

  field :headers_with_underscores_action, 5,
    type: Envoy.Config.Core.V3.HttpProtocolOptions.HeadersWithUnderscoresAction,
    json_name: "headersWithUnderscoresAction",
    enum: true

  field :max_requests_per_connection, 6,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxRequestsPerConnection"
end

defmodule Envoy.Config.Core.V3.Http1ProtocolOptions.HeaderKeyFormat.ProperCaseWords do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Config.Core.V3.Http1ProtocolOptions.HeaderKeyFormat do
  @moduledoc """
  [#next-free-field: 9]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :header_format, 0

  field :proper_case_words, 1,
    type: Envoy.Config.Core.V3.Http1ProtocolOptions.HeaderKeyFormat.ProperCaseWords,
    json_name: "properCaseWords",
    oneof: 0

  field :stateful_formatter, 8,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "statefulFormatter",
    oneof: 0
end

defmodule Envoy.Config.Core.V3.Http1ProtocolOptions do
  @moduledoc """
  [#next-free-field: 11]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :allow_absolute_url, 1, type: Google.Protobuf.BoolValue, json_name: "allowAbsoluteUrl"
  field :accept_http_10, 2, type: :bool, json_name: "acceptHttp10"
  field :default_host_for_http_10, 3, type: :string, json_name: "defaultHostForHttp10"

  field :header_key_format, 4,
    type: Envoy.Config.Core.V3.Http1ProtocolOptions.HeaderKeyFormat,
    json_name: "headerKeyFormat"

  field :enable_trailers, 5, type: :bool, json_name: "enableTrailers"
  field :allow_chunked_length, 6, type: :bool, json_name: "allowChunkedLength"

  field :override_stream_error_on_invalid_http_message, 7,
    type: Google.Protobuf.BoolValue,
    json_name: "overrideStreamErrorOnInvalidHttpMessage"

  field :send_fully_qualified_url, 8, type: :bool, json_name: "sendFullyQualifiedUrl"

  field :use_balsa_parser, 9,
    type: Google.Protobuf.BoolValue,
    json_name: "useBalsaParser",
    deprecated: false

  field :allow_custom_methods, 10, type: :bool, json_name: "allowCustomMethods", deprecated: false
end

defmodule Envoy.Config.Core.V3.KeepaliveSettings do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :interval, 1, type: Google.Protobuf.Duration, deprecated: false
  field :timeout, 2, type: Google.Protobuf.Duration, deprecated: false
  field :interval_jitter, 3, type: Envoy.Type.V3.Percent, json_name: "intervalJitter"

  field :connection_idle_interval, 4,
    type: Google.Protobuf.Duration,
    json_name: "connectionIdleInterval",
    deprecated: false
end

defmodule Envoy.Config.Core.V3.Http2ProtocolOptions.SettingsParameter do
  @moduledoc """
  Defines a parameter to be sent in the SETTINGS frame.
  See `RFC7540, sec. 6.5.1 <https://tools.ietf.org/html/rfc7540#section-6.5.1>`_ for details.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :identifier, 1, type: Google.Protobuf.UInt32Value, deprecated: false
  field :value, 2, type: Google.Protobuf.UInt32Value, deprecated: false
end

defmodule Envoy.Config.Core.V3.Http2ProtocolOptions do
  @moduledoc """
  [#next-free-field: 18]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :hpack_table_size, 1, type: Google.Protobuf.UInt32Value, json_name: "hpackTableSize"

  field :max_concurrent_streams, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConcurrentStreams",
    deprecated: false

  field :initial_stream_window_size, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "initialStreamWindowSize",
    deprecated: false

  field :initial_connection_window_size, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "initialConnectionWindowSize",
    deprecated: false

  field :allow_connect, 5, type: :bool, json_name: "allowConnect"
  field :allow_metadata, 6, type: :bool, json_name: "allowMetadata"

  field :max_outbound_frames, 7,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxOutboundFrames",
    deprecated: false

  field :max_outbound_control_frames, 8,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxOutboundControlFrames",
    deprecated: false

  field :max_consecutive_inbound_frames_with_empty_payload, 9,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConsecutiveInboundFramesWithEmptyPayload"

  field :max_inbound_priority_frames_per_stream, 10,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxInboundPriorityFramesPerStream"

  field :max_inbound_window_update_frames_per_data_frame_sent, 11,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxInboundWindowUpdateFramesPerDataFrameSent",
    deprecated: false

  field :stream_error_on_invalid_http_messaging, 12,
    type: :bool,
    json_name: "streamErrorOnInvalidHttpMessaging",
    deprecated: true

  field :override_stream_error_on_invalid_http_message, 14,
    type: Google.Protobuf.BoolValue,
    json_name: "overrideStreamErrorOnInvalidHttpMessage"

  field :custom_settings_parameters, 13,
    repeated: true,
    type: Envoy.Config.Core.V3.Http2ProtocolOptions.SettingsParameter,
    json_name: "customSettingsParameters"

  field :connection_keepalive, 15,
    type: Envoy.Config.Core.V3.KeepaliveSettings,
    json_name: "connectionKeepalive"

  field :use_oghttp2_codec, 16,
    type: Google.Protobuf.BoolValue,
    json_name: "useOghttp2Codec",
    deprecated: false

  field :max_metadata_size, 17, type: Google.Protobuf.UInt64Value, json_name: "maxMetadataSize"
end

defmodule Envoy.Config.Core.V3.GrpcProtocolOptions do
  @moduledoc """
  [#not-implemented-hide:]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :http2_protocol_options, 1,
    type: Envoy.Config.Core.V3.Http2ProtocolOptions,
    json_name: "http2ProtocolOptions"
end

defmodule Envoy.Config.Core.V3.Http3ProtocolOptions do
  @moduledoc """
  A message which allows using HTTP/3.
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :quic_protocol_options, 1,
    type: Envoy.Config.Core.V3.QuicProtocolOptions,
    json_name: "quicProtocolOptions"

  field :override_stream_error_on_invalid_http_message, 2,
    type: Google.Protobuf.BoolValue,
    json_name: "overrideStreamErrorOnInvalidHttpMessage"

  field :allow_extended_connect, 5,
    type: :bool,
    json_name: "allowExtendedConnect",
    deprecated: false

  field :allow_metadata, 6, type: :bool, json_name: "allowMetadata"
end

defmodule Envoy.Config.Core.V3.SchemeHeaderTransformation do
  @moduledoc """
  A message to control transformations to the :scheme header
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :transformation, 0

  field :scheme_to_overwrite, 1,
    type: :string,
    json_name: "schemeToOverwrite",
    oneof: 0,
    deprecated: false

  field :match_upstream, 2, type: :bool, json_name: "matchUpstream"
end

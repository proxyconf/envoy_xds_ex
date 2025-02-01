defmodule Envoy.Config.Tap.V3.OutputSink.Format do
  @moduledoc """
  Output format. All output is in the form of one or more :ref:`TraceWrapper
  <envoy_v3_api_msg_data.tap.v3.TraceWrapper>` messages. This enumeration indicates
  how those messages are written. Note that not all sinks support all output formats. See
  individual sink documentation for more information.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :JSON_BODY_AS_BYTES, 0
  field :JSON_BODY_AS_STRING, 1
  field :PROTO_BINARY, 2
  field :PROTO_BINARY_LENGTH_DELIMITED, 3
  field :PROTO_TEXT, 4
end

defmodule Envoy.Config.Tap.V3.TapConfig do
  @moduledoc """
  Tap configuration.
  [#comment:TODO(mattklein123): Rate limiting]
  [#protodoc-title: Tap common configuration]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :match_config, 1,
    type: Envoy.Config.Tap.V3.MatchPredicate,
    json_name: "matchConfig",
    deprecated: true

  field :match, 4, type: Envoy.Config.Common.Matcher.V3.MatchPredicate

  field :output_config, 2,
    type: Envoy.Config.Tap.V3.OutputConfig,
    json_name: "outputConfig",
    deprecated: false

  field :tap_enabled, 3,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "tapEnabled"
end

defmodule Envoy.Config.Tap.V3.MatchPredicate.MatchSet do
  @moduledoc """
  A set of match configurations used for logical operations.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :rules, 1, repeated: true, type: Envoy.Config.Tap.V3.MatchPredicate, deprecated: false
end

defmodule Envoy.Config.Tap.V3.MatchPredicate do
  @moduledoc """
  Tap match configuration. This is a recursive structure which allows complex nested match
  configurations to be built using various logical operators.
  [#next-free-field: 11]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :rule, 0

  field :or_match, 1,
    type: Envoy.Config.Tap.V3.MatchPredicate.MatchSet,
    json_name: "orMatch",
    oneof: 0

  field :and_match, 2,
    type: Envoy.Config.Tap.V3.MatchPredicate.MatchSet,
    json_name: "andMatch",
    oneof: 0

  field :not_match, 3, type: Envoy.Config.Tap.V3.MatchPredicate, json_name: "notMatch", oneof: 0
  field :any_match, 4, type: :bool, json_name: "anyMatch", oneof: 0, deprecated: false

  field :http_request_headers_match, 5,
    type: Envoy.Config.Tap.V3.HttpHeadersMatch,
    json_name: "httpRequestHeadersMatch",
    oneof: 0

  field :http_request_trailers_match, 6,
    type: Envoy.Config.Tap.V3.HttpHeadersMatch,
    json_name: "httpRequestTrailersMatch",
    oneof: 0

  field :http_response_headers_match, 7,
    type: Envoy.Config.Tap.V3.HttpHeadersMatch,
    json_name: "httpResponseHeadersMatch",
    oneof: 0

  field :http_response_trailers_match, 8,
    type: Envoy.Config.Tap.V3.HttpHeadersMatch,
    json_name: "httpResponseTrailersMatch",
    oneof: 0

  field :http_request_generic_body_match, 9,
    type: Envoy.Config.Tap.V3.HttpGenericBodyMatch,
    json_name: "httpRequestGenericBodyMatch",
    oneof: 0

  field :http_response_generic_body_match, 10,
    type: Envoy.Config.Tap.V3.HttpGenericBodyMatch,
    json_name: "httpResponseGenericBodyMatch",
    oneof: 0
end

defmodule Envoy.Config.Tap.V3.HttpHeadersMatch do
  @moduledoc """
  HTTP headers match configuration.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :headers, 1, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher
end

defmodule Envoy.Config.Tap.V3.HttpGenericBodyMatch.GenericTextMatch do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :rule, 0

  field :string_match, 1, type: :string, json_name: "stringMatch", oneof: 0, deprecated: false
  field :binary_match, 2, type: :bytes, json_name: "binaryMatch", oneof: 0, deprecated: false
end

defmodule Envoy.Config.Tap.V3.HttpGenericBodyMatch do
  @moduledoc """
  HTTP generic body match configuration.
  List of text strings and hex strings to be located in HTTP body.
  All specified strings must be found in the HTTP body for positive match.
  The search may be limited to specified number of bytes from the body start.

  .. attention::

  Searching for patterns in HTTP body is potentially cpu intensive. For each specified pattern, http body is scanned byte by byte to find a match.
  If multiple patterns are specified, the process is repeated for each pattern. If location of a pattern is known, ``bytes_limit`` should be specified
  to scan only part of the http body.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :bytes_limit, 1, type: :uint32, json_name: "bytesLimit"

  field :patterns, 2,
    repeated: true,
    type: Envoy.Config.Tap.V3.HttpGenericBodyMatch.GenericTextMatch,
    deprecated: false
end

defmodule Envoy.Config.Tap.V3.OutputConfig do
  @moduledoc """
  Tap output configuration.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :sinks, 1, repeated: true, type: Envoy.Config.Tap.V3.OutputSink, deprecated: false

  field :max_buffered_rx_bytes, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxBufferedRxBytes"

  field :max_buffered_tx_bytes, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxBufferedTxBytes"

  field :streaming, 4, type: :bool
end

defmodule Envoy.Config.Tap.V3.OutputSink do
  @moduledoc """
  Tap output sink configuration.
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :output_sink_type, 0

  field :format, 1, type: Envoy.Config.Tap.V3.OutputSink.Format, enum: true, deprecated: false

  field :streaming_admin, 2,
    type: Envoy.Config.Tap.V3.StreamingAdminSink,
    json_name: "streamingAdmin",
    oneof: 0

  field :file_per_tap, 3,
    type: Envoy.Config.Tap.V3.FilePerTapSink,
    json_name: "filePerTap",
    oneof: 0

  field :streaming_grpc, 4,
    type: Envoy.Config.Tap.V3.StreamingGrpcSink,
    json_name: "streamingGrpc",
    oneof: 0

  field :buffered_admin, 5,
    type: Envoy.Config.Tap.V3.BufferedAdminSink,
    json_name: "bufferedAdmin",
    oneof: 0

  field :custom_sink, 6,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "customSink",
    oneof: 0
end

defmodule Envoy.Config.Tap.V3.StreamingAdminSink do
  @moduledoc """
  Streaming admin sink configuration.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Config.Tap.V3.BufferedAdminSink do
  @moduledoc """
  BufferedAdminSink configures a tap output to collect traces without returning them until
  one of multiple criteria are satisfied.
  Similar to StreamingAdminSink, it is only allowed to specify the buffered admin output
  sink if the tap is being configured from the ``/tap`` admin endpoint.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :max_traces, 1, type: :uint64, json_name: "maxTraces", deprecated: false
  field :timeout, 2, type: Google.Protobuf.Duration
end

defmodule Envoy.Config.Tap.V3.FilePerTapSink do
  @moduledoc """
  The file per tap sink outputs a discrete file for every tapped stream.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :path_prefix, 1, type: :string, json_name: "pathPrefix", deprecated: false
end

defmodule Envoy.Config.Tap.V3.StreamingGrpcSink do
  @moduledoc """
  [#not-implemented-hide:] Streaming gRPC sink configuration sends the taps to an external gRPC
  server.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :tap_id, 1, type: :string, json_name: "tapId"

  field :grpc_service, 2,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ExternalProcessor.RouteCacheAction do
  @moduledoc """
  Describes the route cache action to be taken when an external processor response
  is received in response to request headers.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DEFAULT, 0
  field :CLEAR, 1
  field :RETAIN, 2
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ExternalProcessor do
  @moduledoc """
  The filter communicates with an external gRPC service called an "external processor"
  that can do a variety of things with the request and response:

  * Access and modify the HTTP headers on the request, response, or both
  * Access and modify the HTTP request and response bodies
  * Access and modify the dynamic stream metadata
  * Immediately send an HTTP response downstream and terminate other processing

  The filter communicates with the server using a gRPC bidirectional stream. After the initial
  request, the external server is in control over what additional data is sent to it
  and how it should be processed.

  By implementing the protocol specified by the stream, the external server can choose:

  * Whether it receives the response message at all
  * Whether it receives the message body at all, in separate chunks, or as a single buffer
  * Whether subsequent HTTP requests are transmitted synchronously or whether they are
  sent asynchronously.
  * To modify request or response trailers if they already exist

  The filter supports up to six different processing steps. Each is represented by
  a gRPC stream message that is sent to the external processor. For each message, the
  processor must send a matching response.

  * Request headers: Contains the headers from the original HTTP request.
  * Request body: Delivered if they are present and sent in a single message if
  the BUFFERED or BUFFERED_PARTIAL mode is chosen, in multiple messages if the
  STREAMED mode is chosen, and not at all otherwise.
  * Request trailers: Delivered if they are present and if the trailer mode is set
  to SEND.
  * Response headers: Contains the headers from the HTTP response. Keep in mind
  that if the upstream system sends them before processing the request body that
  this message may arrive before the complete body.
  * Response body: Sent according to the processing mode like the request body.
  * Response trailers: Delivered according to the processing mode like the
  request trailers.

  By default, the processor sends only the request and response headers messages.
  This may be changed to include any of the six steps by changing the processing_mode
  setting of the filter configuration, or by setting the mode_override of any response
  from the external processor. The latter is only enabled if allow_mode_override is
  set to true. This way, a processor may, for example, use information
  in the request header to determine whether the message body must be examined, or whether
  the proxy should simply stream it straight through.

  All of this together allows a server to process the filter traffic in fairly
  sophisticated ways. For example:

  * A server may choose to examine all or part of the HTTP message bodies depending
  on the content of the headers.
  * A server may choose to immediately reject some messages based on their HTTP
  headers (or other dynamic metadata) and more carefully examine others.
  * A server may asynchronously monitor traffic coming through the filter by inspecting
  headers, bodies, or both, and then decide to switch to a synchronous processing
  mode, either permanently or temporarily.

  The protocol itself is based on a bidirectional gRPC stream. Envoy will send the
  server
  :ref:`ProcessingRequest <envoy_v3_api_msg_service.ext_proc.v3.ProcessingRequest>`
  messages, and the server must reply with
  :ref:`ProcessingResponse <envoy_v3_api_msg_service.ext_proc.v3.ProcessingResponse>`.

  Stats about each gRPC call are recorded in a :ref:`dynamic filter state
  <arch_overview_advanced_filter_state_sharing>` object in a namespace matching the filter
  name.

  [#next-free-field: 23]
  [#protodoc-title: External Processing Filter]
  External Processing Filter
  [#extension: envoy.filters.http.ext_proc]
  The External Processing filter allows an external service to act on HTTP traffic in a flexible way.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :grpc_service, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    deprecated: false

  field :http_service, 20,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ExtProcHttpService,
    json_name: "httpService",
    deprecated: false

  field :failure_mode_allow, 2, type: :bool, json_name: "failureModeAllow"

  field :processing_mode, 3,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode,
    json_name: "processingMode"

  field :request_attributes, 5, repeated: true, type: :string, json_name: "requestAttributes"
  field :response_attributes, 6, repeated: true, type: :string, json_name: "responseAttributes"

  field :message_timeout, 7,
    type: Google.Protobuf.Duration,
    json_name: "messageTimeout",
    deprecated: false

  field :stat_prefix, 8, type: :string, json_name: "statPrefix"

  field :mutation_rules, 9,
    type: Envoy.Config.Common.MutationRules.V3.HeaderMutationRules,
    json_name: "mutationRules"

  field :max_message_timeout, 10,
    type: Google.Protobuf.Duration,
    json_name: "maxMessageTimeout",
    deprecated: false

  field :forward_rules, 12,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.HeaderForwardingRules,
    json_name: "forwardRules"

  field :filter_metadata, 13, type: Google.Protobuf.Struct, json_name: "filterMetadata"
  field :allow_mode_override, 14, type: :bool, json_name: "allowModeOverride"
  field :disable_immediate_response, 15, type: :bool, json_name: "disableImmediateResponse"

  field :metadata_options, 16,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.MetadataOptions,
    json_name: "metadataOptions"

  field :observability_mode, 17, type: :bool, json_name: "observabilityMode"

  field :disable_clear_route_cache, 11,
    type: :bool,
    json_name: "disableClearRouteCache",
    deprecated: false

  field :route_cache_action, 18,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ExternalProcessor.RouteCacheAction,
    json_name: "routeCacheAction",
    enum: true,
    deprecated: false

  field :deferred_close_timeout, 19,
    type: Google.Protobuf.Duration,
    json_name: "deferredCloseTimeout"

  field :send_body_without_waiting_for_header_response, 21,
    type: :bool,
    json_name: "sendBodyWithoutWaitingForHeaderResponse"

  field :allowed_override_modes, 22,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode,
    json_name: "allowedOverrideModes"
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ExtProcHttpService do
  @moduledoc """
  ExtProcHttpService is used for HTTP communication between the filter and the external processing service.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :http_service, 1, type: Envoy.Config.Core.V3.HttpService, json_name: "httpService"
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.MetadataOptions.MetadataNamespaces do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :untyped, 1, repeated: true, type: :string
  field :typed, 2, repeated: true, type: :string
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.MetadataOptions do
  @moduledoc """
  The MetadataOptions structure defines options for the sending and receiving of
  dynamic metadata. Specifically, which namespaces to send to the server, whether
  metadata returned by the server may be written, and how that metadata may be written.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :forwarding_namespaces, 1,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.MetadataOptions.MetadataNamespaces,
    json_name: "forwardingNamespaces"

  field :receiving_namespaces, 2,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.MetadataOptions.MetadataNamespaces,
    json_name: "receivingNamespaces"
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.HeaderForwardingRules do
  @moduledoc """
  The HeaderForwardingRules structure specifies what headers are
  allowed to be forwarded to the external processing server.

  This works as below:

  1. If neither ``allowed_headers`` nor ``disallowed_headers`` is set, all headers are forwarded.
  2. If both ``allowed_headers`` and ``disallowed_headers`` are set, only headers in the
  ``allowed_headers`` but not in the ``disallowed_headers`` are forwarded.
  3. If ``allowed_headers`` is set, and ``disallowed_headers`` is not set, only headers in
  the ``allowed_headers`` are forwarded.
  4. If ``disallowed_headers`` is set, and ``allowed_headers`` is not set, all headers except
  headers in the ``disallowed_headers`` are forwarded.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :allowed_headers, 1,
    type: Envoy.Type.Matcher.V3.ListStringMatcher,
    json_name: "allowedHeaders"

  field :disallowed_headers, 2,
    type: Envoy.Type.Matcher.V3.ListStringMatcher,
    json_name: "disallowedHeaders"
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ExtProcPerRoute do
  @moduledoc """
  Extra settings that may be added to per-route configuration for a
  virtual host or cluster.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :override, 0

  field :disabled, 1, type: :bool, oneof: 0, deprecated: false
  field :overrides, 2, type: Envoy.Extensions.Filters.Http.ExtProc.V3.ExtProcOverrides, oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ExtProcOverrides do
  @moduledoc """
  Overrides that may be set on a per-route basis
  [#next-free-field: 8]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :processing_mode, 1,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode,
    json_name: "processingMode"

  field :async_mode, 2, type: :bool, json_name: "asyncMode"
  field :request_attributes, 3, repeated: true, type: :string, json_name: "requestAttributes"
  field :response_attributes, 4, repeated: true, type: :string, json_name: "responseAttributes"
  field :grpc_service, 5, type: Envoy.Config.Core.V3.GrpcService, json_name: "grpcService"

  field :metadata_options, 6,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.MetadataOptions,
    json_name: "metadataOptions"

  field :grpc_initial_metadata, 7,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValue,
    json_name: "grpcInitialMetadata"
end

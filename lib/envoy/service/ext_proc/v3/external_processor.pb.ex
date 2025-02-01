defmodule Envoy.Service.ExtProc.V3.CommonResponse.ResponseStatus do
  @moduledoc """
  The status of the response.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :CONTINUE, 0
  field :CONTINUE_AND_REPLACE, 1
end

defmodule Envoy.Service.ExtProc.V3.ProcessingRequest.AttributesEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Service.ExtProc.V3.ProcessingRequest do
  @moduledoc """
  This represents the different types of messages that Envoy can send
  to an external processing server.
  [#next-free-field: 11]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :request, 0

  field :request_headers, 2,
    type: Envoy.Service.ExtProc.V3.HttpHeaders,
    json_name: "requestHeaders",
    oneof: 0

  field :response_headers, 3,
    type: Envoy.Service.ExtProc.V3.HttpHeaders,
    json_name: "responseHeaders",
    oneof: 0

  field :request_body, 4,
    type: Envoy.Service.ExtProc.V3.HttpBody,
    json_name: "requestBody",
    oneof: 0

  field :response_body, 5,
    type: Envoy.Service.ExtProc.V3.HttpBody,
    json_name: "responseBody",
    oneof: 0

  field :request_trailers, 6,
    type: Envoy.Service.ExtProc.V3.HttpTrailers,
    json_name: "requestTrailers",
    oneof: 0

  field :response_trailers, 7,
    type: Envoy.Service.ExtProc.V3.HttpTrailers,
    json_name: "responseTrailers",
    oneof: 0

  field :metadata_context, 8, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataContext"

  field :attributes, 9,
    repeated: true,
    type: Envoy.Service.ExtProc.V3.ProcessingRequest.AttributesEntry,
    map: true

  field :observability_mode, 10, type: :bool, json_name: "observabilityMode"
end

defmodule Envoy.Service.ExtProc.V3.ProcessingResponse do
  @moduledoc """
  For every ProcessingRequest received by the server with the ``observability_mode`` field
  set to false, the server must send back exactly one ProcessingResponse message.
  [#next-free-field: 11]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :response, 0

  field :request_headers, 1,
    type: Envoy.Service.ExtProc.V3.HeadersResponse,
    json_name: "requestHeaders",
    oneof: 0

  field :response_headers, 2,
    type: Envoy.Service.ExtProc.V3.HeadersResponse,
    json_name: "responseHeaders",
    oneof: 0

  field :request_body, 3,
    type: Envoy.Service.ExtProc.V3.BodyResponse,
    json_name: "requestBody",
    oneof: 0

  field :response_body, 4,
    type: Envoy.Service.ExtProc.V3.BodyResponse,
    json_name: "responseBody",
    oneof: 0

  field :request_trailers, 5,
    type: Envoy.Service.ExtProc.V3.TrailersResponse,
    json_name: "requestTrailers",
    oneof: 0

  field :response_trailers, 6,
    type: Envoy.Service.ExtProc.V3.TrailersResponse,
    json_name: "responseTrailers",
    oneof: 0

  field :immediate_response, 7,
    type: Envoy.Service.ExtProc.V3.ImmediateResponse,
    json_name: "immediateResponse",
    oneof: 0

  field :dynamic_metadata, 8, type: Google.Protobuf.Struct, json_name: "dynamicMetadata"

  field :mode_override, 9,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode,
    json_name: "modeOverride"

  field :override_message_timeout, 10,
    type: Google.Protobuf.Duration,
    json_name: "overrideMessageTimeout"
end

defmodule Envoy.Service.ExtProc.V3.HttpHeaders.AttributesEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Service.ExtProc.V3.HttpHeaders do
  @moduledoc """
  This message is sent to the external server when the HTTP request and responses
  are first received.
  The following are messages that are sent to the server.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :headers, 1, type: Envoy.Config.Core.V3.HeaderMap

  field :attributes, 2,
    repeated: true,
    type: Envoy.Service.ExtProc.V3.HttpHeaders.AttributesEntry,
    map: true,
    deprecated: true

  field :end_of_stream, 3, type: :bool, json_name: "endOfStream"
end

defmodule Envoy.Service.ExtProc.V3.HttpBody do
  @moduledoc """
  This message is sent to the external server when the HTTP request and
  response bodies are received.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :body, 1, type: :bytes
  field :end_of_stream, 2, type: :bool, json_name: "endOfStream"
end

defmodule Envoy.Service.ExtProc.V3.HttpTrailers do
  @moduledoc """
  This message is sent to the external server when the HTTP request and
  response trailers are received.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :trailers, 1, type: Envoy.Config.Core.V3.HeaderMap
end

defmodule Envoy.Service.ExtProc.V3.HeadersResponse do
  @moduledoc """
  This message is sent by the external server to Envoy after ``HttpHeaders`` was
  sent to it.
  The following are messages that may be sent back by the server.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :response, 1, type: Envoy.Service.ExtProc.V3.CommonResponse
end

defmodule Envoy.Service.ExtProc.V3.BodyResponse do
  @moduledoc """
  This message is sent by the external server to Envoy after ``HttpBody`` was
  sent to it.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :response, 1, type: Envoy.Service.ExtProc.V3.CommonResponse
end

defmodule Envoy.Service.ExtProc.V3.TrailersResponse do
  @moduledoc """
  This message is sent by the external server to Envoy after ``HttpTrailers`` was
  sent to it.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :header_mutation, 1,
    type: Envoy.Service.ExtProc.V3.HeaderMutation,
    json_name: "headerMutation"
end

defmodule Envoy.Service.ExtProc.V3.CommonResponse do
  @moduledoc """
  This message contains common fields between header and body responses.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :status, 1,
    type: Envoy.Service.ExtProc.V3.CommonResponse.ResponseStatus,
    enum: true,
    deprecated: false

  field :header_mutation, 2,
    type: Envoy.Service.ExtProc.V3.HeaderMutation,
    json_name: "headerMutation"

  field :body_mutation, 3, type: Envoy.Service.ExtProc.V3.BodyMutation, json_name: "bodyMutation"
  field :trailers, 4, type: Envoy.Config.Core.V3.HeaderMap
  field :clear_route_cache, 5, type: :bool, json_name: "clearRouteCache"
end

defmodule Envoy.Service.ExtProc.V3.ImmediateResponse do
  @moduledoc """
  This message causes the filter to attempt to create a locally
  generated response, send it  downstream, stop processing
  additional filters, and ignore any additional messages received
  from the remote server for this request or response. If a response
  has already started, then  this will either ship the reply directly
  to the downstream codec, or reset the stream.
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :status, 1, type: Envoy.Type.V3.HttpStatus, deprecated: false
  field :headers, 2, type: Envoy.Service.ExtProc.V3.HeaderMutation
  field :body, 3, type: :bytes
  field :grpc_status, 4, type: Envoy.Service.ExtProc.V3.GrpcStatus, json_name: "grpcStatus"
  field :details, 5, type: :string
end

defmodule Envoy.Service.ExtProc.V3.GrpcStatus do
  @moduledoc """
  This message specifies a gRPC status for an ImmediateResponse message.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :status, 1, type: :uint32
end

defmodule Envoy.Service.ExtProc.V3.HeaderMutation do
  @moduledoc """
  Change HTTP headers or trailers by appending, replacing, or removing
  headers.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :set_headers, 1,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "setHeaders"

  field :remove_headers, 2, repeated: true, type: :string, json_name: "removeHeaders"
end

defmodule Envoy.Service.ExtProc.V3.StreamedBodyResponse do
  @moduledoc """
  The body response message corresponding to FULL_DUPLEX_STREAMED body mode.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :body, 1, type: :bytes
  field :end_of_stream, 2, type: :bool, json_name: "endOfStream"
end

defmodule Envoy.Service.ExtProc.V3.BodyMutation do
  @moduledoc """
  This message specifies the body mutation the server sends to Envoy.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :mutation, 0

  field :body, 1, type: :bytes, oneof: 0
  field :clear_body, 2, type: :bool, json_name: "clearBody", oneof: 0

  field :streamed_response, 3,
    type: Envoy.Service.ExtProc.V3.StreamedBodyResponse,
    json_name: "streamedResponse",
    oneof: 0,
    deprecated: false
end

defmodule Envoy.Service.ExtProc.V3.ExternalProcessor.Service do
  @moduledoc """
  A service that can access and modify HTTP requests and responses
  as part of a filter chain.
  The overall external processing protocol works like this:

  1. Envoy sends to the service information about the HTTP request.
  2. The service sends back a ProcessingResponse message that directs Envoy
  to either stop processing, continue without it, or send it the
  next chunk of the message body.
  3. If so requested, Envoy sends the server chunks of the message body,
  or the entire body at once. In either case, the server sends back
  a ProcessingResponse after each message it receives.
  4. If so requested, Envoy sends the server the HTTP trailers,
  and the server sends back a ProcessingResponse.
  5. At this point, request processing is done, and we pick up again
  at step 1 when Envoy receives a response from the upstream server.
  6. At any point above, if the server closes the gRPC stream cleanly,
  then Envoy proceeds without consulting the server.
  7. At any point above, if the server closes the gRPC stream with an error,
  then Envoy returns a 500 error to the client, unless the filter
  was configured to ignore errors.

  In other words, the process is a request/response conversation, but
  using a gRPC stream to make it easier for the server to
  maintain state.
  [#protodoc-title: External processing service]
  """

  use GRPC.Service,
    name: "envoy.service.ext_proc.v3.ExternalProcessor",
    protoc_gen_elixir_version: "0.14.0"

  rpc :Process,
      stream(Envoy.Service.ExtProc.V3.ProcessingRequest),
      stream(Envoy.Service.ExtProc.V3.ProcessingResponse)
end

defmodule Envoy.Service.ExtProc.V3.ExternalProcessor.Stub do
  use GRPC.Stub, service: Envoy.Service.ExtProc.V3.ExternalProcessor.Service
end

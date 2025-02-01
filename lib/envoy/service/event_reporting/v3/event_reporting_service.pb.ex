defmodule Envoy.Service.EventReporting.V3.StreamEventsRequest.Identifier do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :node, 1, type: Envoy.Config.Core.V3.Node, deprecated: false
end

defmodule Envoy.Service.EventReporting.V3.StreamEventsRequest do
  @moduledoc """
  [#not-implemented-hide:]
  An events envoy sends to the management server.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :identifier, 1, type: Envoy.Service.EventReporting.V3.StreamEventsRequest.Identifier
  field :events, 2, repeated: true, type: Google.Protobuf.Any, deprecated: false
end

defmodule Envoy.Service.EventReporting.V3.StreamEventsResponse do
  @moduledoc """
  [#not-implemented-hide:]
  The management server may send envoy a StreamEventsResponse to tell which events the server
  is interested in. In future, with aggregated event reporting service, this message will
  contain, for example, clusters the envoy should send events for, or event types the server
  wants to process.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.EventReporting.V3.EventReportingService.Service do
  @moduledoc """
  [#not-implemented-hide:]
  Service for streaming different types of events from Envoy to a server. The examples of
  such events may be health check or outlier detection events.
  [#protodoc-title: gRPC Event Reporting Service]
  """

  use GRPC.Service,
    name: "envoy.service.event_reporting.v3.EventReportingService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :StreamEvents,
      stream(Envoy.Service.EventReporting.V3.StreamEventsRequest),
      stream(Envoy.Service.EventReporting.V3.StreamEventsResponse)
end

defmodule Envoy.Service.EventReporting.V3.EventReportingService.Stub do
  use GRPC.Stub, service: Envoy.Service.EventReporting.V3.EventReportingService.Service
end

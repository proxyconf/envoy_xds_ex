defmodule Envoy.Config.Trace.V3.ZipkinConfig.CollectorEndpointVersion do
  @moduledoc """
  Available Zipkin collector endpoint versions.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :DEPRECATED_AND_UNAVAILABLE_DO_NOT_USE, 0
  field :HTTP_JSON, 1
  field :HTTP_PROTO, 2
  field :GRPC, 3
end

defmodule Envoy.Config.Trace.V3.ZipkinConfig do
  @moduledoc """
  Configuration for the Zipkin tracer.
  [#extension: envoy.tracers.zipkin]
  [#next-free-field: 8]
  [#protodoc-title: Zipkin tracer]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :collector_cluster, 1, type: :string, json_name: "collectorCluster", deprecated: false
  field :collector_endpoint, 2, type: :string, json_name: "collectorEndpoint", deprecated: false
  field :trace_id_128bit, 3, type: :bool, json_name: "traceId128bit"
  field :shared_span_context, 4, type: Google.Protobuf.BoolValue, json_name: "sharedSpanContext"

  field :collector_endpoint_version, 5,
    type: Envoy.Config.Trace.V3.ZipkinConfig.CollectorEndpointVersion,
    json_name: "collectorEndpointVersion",
    enum: true

  field :collector_hostname, 6, type: :string, json_name: "collectorHostname"

  field :split_spans_for_request, 7,
    type: :bool,
    json_name: "splitSpansForRequest",
    deprecated: true
end

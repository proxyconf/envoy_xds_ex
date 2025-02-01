defmodule Envoy.Config.Filter.Http.GrpcStats.V2alpha.FilterConfig do
  @moduledoc """
  gRPC statistics filter configuration
  [#protodoc-title: gRPC statistics] gRPC statistics filter
  :ref:`configuration overview <config_http_filters_grpc_stats>`.
  [#extension: envoy.filters.http.grpc_stats]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :per_method_stat_specifier, 0

  field :emit_filter_state, 1, type: :bool, json_name: "emitFilterState"

  field :individual_method_stats_allowlist, 2,
    type: Envoy.Api.V2.Core.GrpcMethodList,
    json_name: "individualMethodStatsAllowlist",
    oneof: 0

  field :stats_for_all_methods, 3,
    type: Google.Protobuf.BoolValue,
    json_name: "statsForAllMethods",
    oneof: 0
end

defmodule Envoy.Config.Filter.Http.GrpcStats.V2alpha.FilterObject do
  @moduledoc """
  gRPC statistics filter state object in protobuf form.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :request_message_count, 1, type: :uint64, json_name: "requestMessageCount"
  field :response_message_count, 2, type: :uint64, json_name: "responseMessageCount"
end

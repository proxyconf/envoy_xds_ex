defmodule Envoy.Extensions.Filters.Http.GrpcStats.V3.FilterConfig do
  @moduledoc """
  gRPC statistics filter configuration
  [#next-free-field: 6]
  [#protodoc-title: gRPC statistics] gRPC statistics filter
  :ref:`configuration overview <config_http_filters_grpc_stats>`.
  [#extension: envoy.filters.http.grpc_stats]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :per_method_stat_specifier, 0

  field :emit_filter_state, 1, type: :bool, json_name: "emitFilterState"

  field :individual_method_stats_allowlist, 2,
    type: Envoy.Config.Core.V3.GrpcMethodList,
    json_name: "individualMethodStatsAllowlist",
    oneof: 0

  field :stats_for_all_methods, 3,
    type: Google.Protobuf.BoolValue,
    json_name: "statsForAllMethods",
    oneof: 0

  field :enable_upstream_stats, 4, type: :bool, json_name: "enableUpstreamStats"

  field :replace_dots_in_grpc_service_name, 5,
    type: :bool,
    json_name: "replaceDotsInGrpcServiceName"
end

defmodule Envoy.Extensions.Filters.Http.GrpcStats.V3.FilterObject do
  @moduledoc """
  gRPC statistics filter state object in protobuf form.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :request_message_count, 1, type: :uint64, json_name: "requestMessageCount"
  field :response_message_count, 2, type: :uint64, json_name: "responseMessageCount"
end

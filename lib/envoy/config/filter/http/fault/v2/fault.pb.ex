defmodule Envoy.Config.Filter.Http.Fault.V2.FaultAbort.HeaderAbort do
  @moduledoc """
  Fault aborts are controlled via an HTTP header (if applicable). See the
  :ref:`HTTP fault filter <config_http_filters_fault_injection_http_header>` documentation for
  more information.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Config.Filter.Http.Fault.V2.FaultAbort do
  @moduledoc """
  [#protodoc-title: Fault Injection]
  Fault Injection :ref:`configuration overview <config_http_filters_fault_injection>`.
  [#extension: envoy.filters.http.fault]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :error_type, 0

  field :http_status, 2, type: :uint32, json_name: "httpStatus", oneof: 0, deprecated: false

  field :header_abort, 4,
    type: Envoy.Config.Filter.Http.Fault.V2.FaultAbort.HeaderAbort,
    json_name: "headerAbort",
    oneof: 0

  field :percentage, 3, type: Envoy.Type.FractionalPercent
end

defmodule Envoy.Config.Filter.Http.Fault.V2.HTTPFault do
  @moduledoc """
  [#next-free-field: 14]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :delay, 1, type: Envoy.Config.Filter.Fault.V2.FaultDelay
  field :abort, 2, type: Envoy.Config.Filter.Http.Fault.V2.FaultAbort
  field :upstream_cluster, 3, type: :string, json_name: "upstreamCluster"
  field :headers, 4, repeated: true, type: Envoy.Api.V2.Route.HeaderMatcher
  field :downstream_nodes, 5, repeated: true, type: :string, json_name: "downstreamNodes"
  field :max_active_faults, 6, type: Google.Protobuf.UInt32Value, json_name: "maxActiveFaults"

  field :response_rate_limit, 7,
    type: Envoy.Config.Filter.Fault.V2.FaultRateLimit,
    json_name: "responseRateLimit"

  field :delay_percent_runtime, 8, type: :string, json_name: "delayPercentRuntime"
  field :abort_percent_runtime, 9, type: :string, json_name: "abortPercentRuntime"
  field :delay_duration_runtime, 10, type: :string, json_name: "delayDurationRuntime"
  field :abort_http_status_runtime, 11, type: :string, json_name: "abortHttpStatusRuntime"
  field :max_active_faults_runtime, 12, type: :string, json_name: "maxActiveFaultsRuntime"

  field :response_rate_limit_percent_runtime, 13,
    type: :string,
    json_name: "responseRateLimitPercentRuntime"
end

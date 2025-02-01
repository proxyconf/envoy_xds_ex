defmodule Envoy.Extensions.LoadBalancingPolicies.ClientSideWeightedRoundRobin.V3.ClientSideWeightedRoundRobin do
  @moduledoc """
  Configuration for the client_side_weighted_round_robin LB policy.

  This policy differs from the built-in ROUND_ROBIN policy in terms of
  how the endpoint weights are determined. In the ROUND_ROBIN policy,
  the endpoint weights are sent by the control plane via EDS. However,
  in this policy, the endpoint weights are instead determined via qps (queries
  per second), eps (errors per second), and utilization metrics sent by the
  endpoint using the Open Request Cost Aggregation (ORCA) protocol. Utilization
  is determined by using the ORCA application_utilization field, if set, or
  else falling back to the cpu_utilization field. All queries count toward qps,
  regardless of result. Only failed queries count toward eps. A config
  parameter error_utilization_penalty controls the penalty to adjust endpoint
  weights using eps and qps. The weight of a given endpoint is computed as:
  ``qps / (utilization + eps/qps * error_utilization_penalty)``.

  See the :ref:`load balancing architecture
  overview<arch_overview_load_balancing_types>` for more information.

  [#next-free-field: 8]
  [#protodoc-title: Client-Side Weighted Round Robin Load Balancing Policy]
  [#extension: envoy.load_balancing_policies.client_side_weighted_round_robin]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :enable_oob_load_report, 1,
    type: Google.Protobuf.BoolValue,
    json_name: "enableOobLoadReport"

  field :oob_reporting_period, 2, type: Google.Protobuf.Duration, json_name: "oobReportingPeriod"
  field :blackout_period, 3, type: Google.Protobuf.Duration, json_name: "blackoutPeriod"

  field :weight_expiration_period, 4,
    type: Google.Protobuf.Duration,
    json_name: "weightExpirationPeriod"

  field :weight_update_period, 5, type: Google.Protobuf.Duration, json_name: "weightUpdatePeriod"

  field :error_utilization_penalty, 6,
    type: Google.Protobuf.FloatValue,
    json_name: "errorUtilizationPenalty",
    deprecated: false

  field :metric_names_for_computing_utilization, 7,
    repeated: true,
    type: :string,
    json_name: "metricNamesForComputingUtilization"
end

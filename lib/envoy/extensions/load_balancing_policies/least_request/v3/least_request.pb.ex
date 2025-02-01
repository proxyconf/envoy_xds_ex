defmodule Envoy.Extensions.LoadBalancingPolicies.LeastRequest.V3.LeastRequest.SelectionMethod do
  @moduledoc """
  Available methods for selecting the host set from which to return the host with the
  fewest active requests.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :N_CHOICES, 0
  field :FULL_SCAN, 1
end

defmodule Envoy.Extensions.LoadBalancingPolicies.LeastRequest.V3.LeastRequest do
  @moduledoc """
  This configuration allows the built-in LEAST_REQUEST LB policy to be configured via the LB policy
  extension point. See the :ref:`load balancing architecture overview
  <arch_overview_load_balancing_types>` for more information.
  [#next-free-field: 7]
  [#protodoc-title: Least Request Load Balancing Policy]
  [#extension: envoy.load_balancing_policies.least_request]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :choice_count, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "choiceCount",
    deprecated: false

  field :active_request_bias, 2,
    type: Envoy.Config.Core.V3.RuntimeDouble,
    json_name: "activeRequestBias"

  field :slow_start_config, 3,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.SlowStartConfig,
    json_name: "slowStartConfig"

  field :locality_lb_config, 4,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig,
    json_name: "localityLbConfig"

  field :enable_full_scan, 5,
    type: Google.Protobuf.BoolValue,
    json_name: "enableFullScan",
    deprecated: true

  field :selection_method, 6,
    type: Envoy.Extensions.LoadBalancingPolicies.LeastRequest.V3.LeastRequest.SelectionMethod,
    json_name: "selectionMethod",
    enum: true,
    deprecated: false
end

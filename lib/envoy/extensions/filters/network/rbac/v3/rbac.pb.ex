defmodule Envoy.Extensions.Filters.Network.Rbac.V3.RBAC.EnforcementType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ONE_TIME_ON_FIRST_BYTE, 0
  field :CONTINUOUS, 1
end

defmodule Envoy.Extensions.Filters.Network.Rbac.V3.RBAC do
  @moduledoc """
  RBAC network filter config.

  Header should not be used in rules/shadow_rules in RBAC network filter as
  this information is only available in :ref:`RBAC http filter <config_http_filters_rbac>`.
  [#next-free-field: 9]
  [#protodoc-title: RBAC]
  Role-Based Access Control :ref:`configuration overview <config_network_filters_rbac>`.
  [#extension: envoy.filters.network.rbac]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :rules, 1, type: Envoy.Config.Rbac.V3.RBAC, deprecated: false
  field :matcher, 6, type: Xds.Type.Matcher.V3.Matcher, deprecated: false

  field :shadow_rules, 2,
    type: Envoy.Config.Rbac.V3.RBAC,
    json_name: "shadowRules",
    deprecated: false

  field :shadow_matcher, 7,
    type: Xds.Type.Matcher.V3.Matcher,
    json_name: "shadowMatcher",
    deprecated: false

  field :shadow_rules_stat_prefix, 5, type: :string, json_name: "shadowRulesStatPrefix"
  field :stat_prefix, 3, type: :string, json_name: "statPrefix", deprecated: false

  field :enforcement_type, 4,
    type: Envoy.Extensions.Filters.Network.Rbac.V3.RBAC.EnforcementType,
    json_name: "enforcementType",
    enum: true

  field :delay_deny, 8, type: Google.Protobuf.Duration, json_name: "delayDeny"
end

defmodule Envoy.Extensions.Filters.Http.Rbac.V3.RBAC do
  @moduledoc """
  RBAC filter config.
  [#next-free-field: 8]
  [#protodoc-title: RBAC]
  Role-Based Access Control :ref:`configuration overview <config_http_filters_rbac>`.
  [#extension: envoy.filters.http.rbac]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :rules, 1, type: Envoy.Config.Rbac.V3.RBAC, deprecated: false
  field :rules_stat_prefix, 6, type: :string, json_name: "rulesStatPrefix"
  field :matcher, 4, type: Xds.Type.Matcher.V3.Matcher, deprecated: false

  field :shadow_rules, 2,
    type: Envoy.Config.Rbac.V3.RBAC,
    json_name: "shadowRules",
    deprecated: false

  field :shadow_matcher, 5,
    type: Xds.Type.Matcher.V3.Matcher,
    json_name: "shadowMatcher",
    deprecated: false

  field :shadow_rules_stat_prefix, 3, type: :string, json_name: "shadowRulesStatPrefix"
  field :track_per_rule_stats, 7, type: :bool, json_name: "trackPerRuleStats"
end

defmodule Envoy.Extensions.Filters.Http.Rbac.V3.RBACPerRoute do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :rbac, 2, type: Envoy.Extensions.Filters.Http.Rbac.V3.RBAC
end

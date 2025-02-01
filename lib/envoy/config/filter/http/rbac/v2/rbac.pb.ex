defmodule Envoy.Config.Filter.Http.Rbac.V2.RBAC do
  @moduledoc """
  RBAC filter config.
  [#protodoc-title: RBAC]
  Role-Based Access Control :ref:`configuration overview <config_http_filters_rbac>`.
  [#extension: envoy.filters.http.rbac]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :rules, 1, type: Envoy.Config.Rbac.V2.RBAC
  field :shadow_rules, 2, type: Envoy.Config.Rbac.V2.RBAC, json_name: "shadowRules"
end

defmodule Envoy.Config.Filter.Http.Rbac.V2.RBACPerRoute do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :rbac, 2, type: Envoy.Config.Filter.Http.Rbac.V2.RBAC
end

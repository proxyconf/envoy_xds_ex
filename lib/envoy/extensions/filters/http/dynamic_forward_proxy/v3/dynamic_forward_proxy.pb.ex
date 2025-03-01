defmodule Envoy.Extensions.Filters.Http.DynamicForwardProxy.V3.FilterConfig do
  @moduledoc """
  Configuration for the dynamic forward proxy HTTP filter. See the :ref:`architecture overview
  <arch_overview_http_dynamic_forward_proxy>` for more information.
  [#extension: envoy.filters.http.dynamic_forward_proxy]
  [#protodoc-title: Dynamic forward proxy]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :implementation_specifier, 0

  field :dns_cache_config, 1,
    type: Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheConfig,
    json_name: "dnsCacheConfig",
    oneof: 0

  field :sub_cluster_config, 3,
    type: Envoy.Extensions.Filters.Http.DynamicForwardProxy.V3.SubClusterConfig,
    json_name: "subClusterConfig",
    oneof: 0

  field :save_upstream_address, 2, type: :bool, json_name: "saveUpstreamAddress"
end

defmodule Envoy.Extensions.Filters.Http.DynamicForwardProxy.V3.PerRouteConfig do
  @moduledoc """
  Per route Configuration for the dynamic forward proxy HTTP filter.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :host_rewrite_specifier, 0

  field :host_rewrite_literal, 1, type: :string, json_name: "hostRewriteLiteral", oneof: 0
  field :host_rewrite_header, 2, type: :string, json_name: "hostRewriteHeader", oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.DynamicForwardProxy.V3.SubClusterConfig do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cluster_init_timeout, 3,
    type: Google.Protobuf.Duration,
    json_name: "clusterInitTimeout",
    deprecated: false
end

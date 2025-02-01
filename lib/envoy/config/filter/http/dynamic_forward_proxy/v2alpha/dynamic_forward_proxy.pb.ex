defmodule Envoy.Config.Filter.Http.DynamicForwardProxy.V2alpha.FilterConfig do
  @moduledoc """
  Configuration for the dynamic forward proxy HTTP filter. See the :ref:`architecture overview
  <arch_overview_http_dynamic_forward_proxy>` for more information.
  [#extension: envoy.filters.http.dynamic_forward_proxy]
  [#protodoc-title: Dynamic forward proxy]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :dns_cache_config, 1,
    type: Envoy.Config.Common.DynamicForwardProxy.V2alpha.DnsCacheConfig,
    json_name: "dnsCacheConfig",
    deprecated: false
end

defmodule Envoy.Config.Filter.Http.DynamicForwardProxy.V2alpha.PerRouteConfig do
  @moduledoc """
  Per route Configuration for the dynamic forward proxy HTTP filter.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :host_rewrite_specifier, 0

  field :host_rewrite, 1, type: :string, json_name: "hostRewrite", oneof: 0, deprecated: false

  field :auto_host_rewrite_header, 2,
    type: :string,
    json_name: "autoHostRewriteHeader",
    oneof: 0,
    deprecated: false
end

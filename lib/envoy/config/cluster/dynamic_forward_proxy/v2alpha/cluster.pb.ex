defmodule Envoy.Config.Cluster.DynamicForwardProxy.V2alpha.ClusterConfig do
  @moduledoc """
  Configuration for the dynamic forward proxy cluster. See the :ref:`architecture overview
  <arch_overview_http_dynamic_forward_proxy>` for more information.
  [#extension: envoy.clusters.dynamic_forward_proxy]
  [#protodoc-title: Dynamic forward proxy cluster configuration]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :dns_cache_config, 1,
    type: Envoy.Config.Common.DynamicForwardProxy.V2alpha.DnsCacheConfig,
    json_name: "dnsCacheConfig",
    deprecated: false
end

defmodule Envoy.Config.Common.DynamicForwardProxy.V2alpha.DnsCacheConfig do
  @moduledoc """
  Configuration for the dynamic forward proxy DNS cache. See the :ref:`architecture overview
  <arch_overview_http_dynamic_forward_proxy>` for more information.
  [#next-free-field: 7]
  [#protodoc-title: Dynamic forward proxy common configuration]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false

  field :dns_lookup_family, 2,
    type: Envoy.Api.V2.Cluster.DnsLookupFamily,
    json_name: "dnsLookupFamily",
    enum: true,
    deprecated: false

  field :dns_refresh_rate, 3,
    type: Google.Protobuf.Duration,
    json_name: "dnsRefreshRate",
    deprecated: false

  field :host_ttl, 4, type: Google.Protobuf.Duration, json_name: "hostTtl", deprecated: false
  field :max_hosts, 5, type: Google.Protobuf.UInt32Value, json_name: "maxHosts", deprecated: false

  field :dns_failure_refresh_rate, 6,
    type: Envoy.Api.V2.Cluster.RefreshRate,
    json_name: "dnsFailureRefreshRate"
end

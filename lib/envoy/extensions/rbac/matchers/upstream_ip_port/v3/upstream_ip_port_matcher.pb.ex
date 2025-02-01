defmodule Envoy.Extensions.Rbac.Matchers.UpstreamIpPort.V3.UpstreamIpPortMatcher do
  @moduledoc """
  This is configuration for matching upstream ip and port.
  Note that although both fields are optional, at least one of IP or port must be supplied. If only
  one is supplied the other is a wildcard match.
  This matcher requires a filter in the chain to have saved the upstream address in the
  filter state before the matcher is executed by RBAC filter. The state should be saved with key
  ``envoy.stream.upstream_address`` (See
  :repo:`upstream_address.h<source/common/stream_info/upstream_address.h>`).
  Also, See :repo:`proxy_filter.cc<source/extensions/filters/http/dynamic_forward_proxy/proxy_filter.cc>`
  for an example of a filter which populates the FilterState.
  [#protodoc-title: RBAC upstream IP and port matcher plugin]
  [#extension: envoy.rbac.matchers.upstream_ip_port]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :upstream_ip, 1, type: Envoy.Config.Core.V3.CidrRange, json_name: "upstreamIp"
  field :upstream_port_range, 2, type: Envoy.Type.V3.Int64Range, json_name: "upstreamPortRange"
end

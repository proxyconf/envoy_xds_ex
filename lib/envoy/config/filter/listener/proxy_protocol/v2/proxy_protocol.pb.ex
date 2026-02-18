defmodule Envoy.Config.Filter.Listener.ProxyProtocol.V2.ProxyProtocol do
  @moduledoc """
  [#protodoc-title: Proxy Protocol Filter]
  PROXY protocol listener filter.
  [#extension: envoy.filters.listener.proxy_protocol]
  """

  use Protobuf,
    full_name: "envoy.config.filter.listener.proxy_protocol.v2.ProxyProtocol",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

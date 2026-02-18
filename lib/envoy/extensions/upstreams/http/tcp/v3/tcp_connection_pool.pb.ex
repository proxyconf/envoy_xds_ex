defmodule Envoy.Extensions.Upstreams.Http.Tcp.V3.TcpConnectionPoolProto do
  @moduledoc """
  A connection pool which forwards downstream HTTP as TCP to upstream,
  [#extension: envoy.upstreams.http.tcp]
  [#protodoc-title: Tcp Connection Pool]
  """

  use Protobuf,
    full_name: "envoy.extensions.upstreams.http.tcp.v3.TcpConnectionPoolProto",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

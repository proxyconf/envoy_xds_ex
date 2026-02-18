defmodule Envoy.Extensions.Upstreams.Http.Udp.V3.UdpConnectionPoolProto do
  @moduledoc """
  A connection pool which forwards downstream HTTP as UDP to upstream,
  [#extension: envoy.upstreams.http.udp]
  [#protodoc-title: Udp Connection Pool]
  """

  use Protobuf,
    full_name: "envoy.extensions.upstreams.http.udp.v3.UdpConnectionPoolProto",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Envoy.Extensions.Upstreams.Http.Udp.V3.UdpConnectionPoolProto do
  @moduledoc """
  A connection pool which forwards downstream HTTP as UDP to upstream,
  [#extension: envoy.upstreams.http.udp]
  [#protodoc-title: Udp Connection Pool]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

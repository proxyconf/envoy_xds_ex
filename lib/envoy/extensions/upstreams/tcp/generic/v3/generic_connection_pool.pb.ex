defmodule Envoy.Extensions.Upstreams.Tcp.Generic.V3.GenericConnectionPoolProto do
  @moduledoc """
  A connection pool which forwards downstream TCP as TCP or HTTP to upstream,
  based on CONNECT configuration.
  [#extension: envoy.upstreams.tcp.generic]
  [#protodoc-title: Generic Connection Pool]
  """

  use Protobuf,
    full_name: "envoy.extensions.upstreams.tcp.generic.v3.GenericConnectionPoolProto",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

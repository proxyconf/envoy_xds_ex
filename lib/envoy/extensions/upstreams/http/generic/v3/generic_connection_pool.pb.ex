defmodule Envoy.Extensions.Upstreams.Http.Generic.V3.GenericConnectionPoolProto do
  @moduledoc """
  A connection pool which forwards downstream HTTP as TCP, UDP or HTTP to upstream,
  based on CONNECT configuration.
  [#extension: envoy.upstreams.http.generic]
  [#protodoc-title: Generic Connection Pool]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

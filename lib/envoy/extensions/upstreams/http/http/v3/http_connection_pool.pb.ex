defmodule Envoy.Extensions.Upstreams.Http.Http.V3.HttpConnectionPoolProto do
  @moduledoc """
  A connection pool which forwards downstream HTTP as HTTP to upstream.
  [#extension: envoy.upstreams.http.http]
  [#protodoc-title: Http Connection Pool]
  """

  use Protobuf,
    full_name: "envoy.extensions.upstreams.http.http.v3.HttpConnectionPoolProto",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

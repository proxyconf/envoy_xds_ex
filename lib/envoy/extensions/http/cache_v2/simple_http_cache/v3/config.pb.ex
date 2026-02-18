defmodule Envoy.Extensions.Http.CacheV2.SimpleHttpCache.V3.SimpleHttpCacheV2Config do
  @moduledoc """
  [#extension: envoy.extensions.http.cache_v2.simple]
  [#protodoc-title: SimpleHttpCache CacheFilter storage plugin]
  """

  use Protobuf,
    full_name: "envoy.extensions.http.cache_v2.simple_http_cache.v3.SimpleHttpCacheV2Config",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

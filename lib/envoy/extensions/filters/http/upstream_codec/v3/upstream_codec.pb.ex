defmodule Envoy.Extensions.Filters.Http.UpstreamCodec.V3.UpstreamCodec do
  @moduledoc """
  [#protodoc-title: UpstreamCodec]
  Codec :ref:`configuration overview <config_http_filters_upstream_codec>`.
  [#extension: envoy.filters.http.upstream_codec]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.upstream_codec.v3.UpstreamCodec",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

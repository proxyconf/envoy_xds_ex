defmodule Envoy.Extensions.Filters.Http.OriginalSrc.V3.OriginalSrc do
  @moduledoc """
  The Original Src filter binds upstream connections to the original source address determined
  for the request. This address could come from something like the Proxy Protocol filter, or it
  could come from trusted http headers.
  [#extension: envoy.filters.http.original_src]
  [#protodoc-title: Original Src Filter]
  Use the Original source address on upstream connections.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.original_src.v3.OriginalSrc",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :mark, 1, type: :uint32
end

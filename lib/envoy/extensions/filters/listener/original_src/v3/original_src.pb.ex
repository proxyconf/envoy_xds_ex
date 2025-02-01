defmodule Envoy.Extensions.Filters.Listener.OriginalSrc.V3.OriginalSrc do
  @moduledoc """
  The Original Src filter binds upstream connections to the original source address determined
  for the connection. This address could come from something like the Proxy Protocol filter, or it
  could come from trusted http headers.
  [#protodoc-title: Original Src Filter]
  Use the Original source address on upstream connections.
  [#extension: envoy.filters.listener.original_src]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :bind_port, 1, type: :bool, json_name: "bindPort"
  field :mark, 2, type: :uint32
end

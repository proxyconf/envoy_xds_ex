defmodule Envoy.Extensions.Filters.Http.AlternateProtocolsCache.V3.FilterConfig do
  @moduledoc """
  Configuration for the alternate protocols cache HTTP filter.
  [#extension: envoy.filters.http.alternate_protocols_cache]
  [#protodoc-title: Alternate Protocols Cache]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :alternate_protocols_cache_options, 1,
    type: Envoy.Config.Core.V3.AlternateProtocolsCacheOptions,
    json_name: "alternateProtocolsCacheOptions",
    deprecated: true
end

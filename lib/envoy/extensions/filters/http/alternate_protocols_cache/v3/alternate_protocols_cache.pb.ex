defmodule Envoy.Extensions.Filters.Http.AlternateProtocolsCache.V3.FilterConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :alternate_protocols_cache_options, 1,
    type: Envoy.Config.Core.V3.AlternateProtocolsCacheOptions,
    json_name: "alternateProtocolsCacheOptions",
    deprecated: true
end
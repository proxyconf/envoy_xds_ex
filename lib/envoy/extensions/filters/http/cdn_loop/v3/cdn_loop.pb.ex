defmodule Envoy.Extensions.Filters.Http.CdnLoop.V3.CdnLoopConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :cdn_id, 1, type: :string, json_name: "cdnId", deprecated: false
  field :max_allowed_occurrences, 2, type: :uint32, json_name: "maxAllowedOccurrences"
end
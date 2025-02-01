defmodule Envoy.Extensions.Filters.Http.CdnLoop.V3.CdnLoopConfig do
  @moduledoc """
  CDN-Loop Header filter config. See the :ref:`configuration overview
  <config_http_filters_cdn_loop>` for more information.
  [#protodoc-title: HTTP CDN-Loop Filter]
  [#extension: envoy.filters.http.cdn_loop]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cdn_id, 1, type: :string, json_name: "cdnId", deprecated: false
  field :max_allowed_occurrences, 2, type: :uint32, json_name: "maxAllowedOccurrences"
end

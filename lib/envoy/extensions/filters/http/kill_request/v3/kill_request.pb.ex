defmodule Envoy.Extensions.Filters.Http.KillRequest.V3.KillRequest.Direction do
  @moduledoc """
  On which direction should the filter check for the ``kill_request_header``.
  Default to ``REQUEST`` if unspecified.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :REQUEST, 0
  field :RESPONSE, 1
end

defmodule Envoy.Extensions.Filters.Http.KillRequest.V3.KillRequest do
  @moduledoc """
  Configuration for KillRequest filter.
  [#protodoc-title: Kill Request]
  Kill Request :ref:`configuration overview <config_http_filters_kill_request>`.
  [#extension: envoy.filters.http.kill_request]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :probability, 1, type: Envoy.Type.V3.FractionalPercent
  field :kill_request_header, 2, type: :string, json_name: "killRequestHeader", deprecated: false

  field :direction, 3,
    type: Envoy.Extensions.Filters.Http.KillRequest.V3.KillRequest.Direction,
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Filter.Http.Squash.V2.Squash do
  @moduledoc """
  [#next-free-field: 6]
  [#protodoc-title: Squash]
  Squash :ref:`configuration overview <config_http_filters_squash>`.
  [#extension: envoy.filters.http.squash]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cluster, 1, type: :string, deprecated: false
  field :attachment_template, 2, type: Google.Protobuf.Struct, json_name: "attachmentTemplate"
  field :request_timeout, 3, type: Google.Protobuf.Duration, json_name: "requestTimeout"
  field :attachment_timeout, 4, type: Google.Protobuf.Duration, json_name: "attachmentTimeout"

  field :attachment_poll_period, 5,
    type: Google.Protobuf.Duration,
    json_name: "attachmentPollPeriod"
end

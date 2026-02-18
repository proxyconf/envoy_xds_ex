defmodule Envoy.Api.V2.Core.HttpUri do
  @moduledoc """
  Envoy external URI descriptor
  [#protodoc-title: HTTP Service URI ]
  """

  use Protobuf,
    full_name: "envoy.api.v2.core.HttpUri",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :http_upstream_type, 0

  field :uri, 1, type: :string, deprecated: false
  field :cluster, 2, type: :string, oneof: 0, deprecated: false
  field :timeout, 3, type: Google.Protobuf.Duration, deprecated: false
end

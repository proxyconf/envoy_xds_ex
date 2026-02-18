defmodule Envoy.Data.Tap.V2alpha.Body do
  @moduledoc """
  Wrapper for tapped body data. This includes HTTP request/response body, transport socket received
  and transmitted data, etc.
  [#protodoc-title: Tap common data]
  """

  use Protobuf,
    full_name: "envoy.data.tap.v2alpha.Body",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :body_type, 0

  field :as_bytes, 1, type: :bytes, json_name: "asBytes", oneof: 0
  field :as_string, 2, type: :string, json_name: "asString", oneof: 0
  field :truncated, 3, type: :bool
end

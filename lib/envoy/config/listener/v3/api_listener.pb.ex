defmodule Envoy.Config.Listener.V3.ApiListener do
  @moduledoc """
  Describes a type of API listener, which is used in non-proxy clients. The type of API
  exposed to the non-proxy application depends on the type of API listener.
  [#protodoc-title: API listener]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :api_listener, 1, type: Google.Protobuf.Any, json_name: "apiListener"
end

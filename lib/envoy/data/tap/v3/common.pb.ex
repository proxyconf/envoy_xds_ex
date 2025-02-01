defmodule Envoy.Data.Tap.V3.Body do
  @moduledoc """
  Wrapper for tapped body data. This includes HTTP request/response body, transport socket received
  and transmitted data, etc.
  [#protodoc-title: Tap common data]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :body_type, 0

  field :as_bytes, 1, type: :bytes, json_name: "asBytes", oneof: 0
  field :as_string, 2, type: :string, json_name: "asString", oneof: 0
  field :truncated, 3, type: :bool
end

defmodule Envoy.Data.Tap.V3.Connection do
  @moduledoc """
  Connection properties.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :local_address, 1, type: Envoy.Config.Core.V3.Address, json_name: "localAddress"
  field :remote_address, 2, type: Envoy.Config.Core.V3.Address, json_name: "remoteAddress"
end

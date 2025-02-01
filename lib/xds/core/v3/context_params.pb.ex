defmodule Xds.Core.V3.ContextParams.ParamsEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Xds.Core.V3.ContextParams do
  @moduledoc """
  Additional parameters that can be used to select resource variants. These include any
  global context parameters, per-resource type client feature capabilities and per-resource
  type functional attributes. All per-resource type attributes will be `xds.resource.`
  prefixed and some of these are documented below:

  `xds.resource.listening_address`: The value is "IP:port" (e.g. "10.1.1.3:8080") which is
  the listening address of a Listener. Used in a Listener resource query.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :params, 1, repeated: true, type: Xds.Core.V3.ContextParams.ParamsEntry, map: true
end

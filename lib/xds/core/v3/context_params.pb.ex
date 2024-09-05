defmodule Xds.Core.V3.ContextParams.ParamsEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Xds.Core.V3.ContextParams do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :params, 1, repeated: true, type: Xds.Core.V3.ContextParams.ParamsEntry, map: true
end
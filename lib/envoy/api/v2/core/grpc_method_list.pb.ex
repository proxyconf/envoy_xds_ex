defmodule Envoy.Api.V2.Core.GrpcMethodList.Service do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false

  field :method_names, 2,
    repeated: true,
    type: :string,
    json_name: "methodNames",
    deprecated: false
end

defmodule Envoy.Api.V2.Core.GrpcMethodList do
  @moduledoc """
  A list of gRPC methods which can be used as an allowlist, for example.
  [#protodoc-title: gRPC method list]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :services, 1, repeated: true, type: Envoy.Api.V2.Core.GrpcMethodList.Service
end

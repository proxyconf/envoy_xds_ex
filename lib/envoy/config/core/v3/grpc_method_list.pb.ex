defmodule Envoy.Config.Core.V3.GrpcMethodList.Service do
  use Protobuf,
    full_name: "envoy.config.core.v3.GrpcMethodList.Service",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false

  field :method_names, 2,
    repeated: true,
    type: :string,
    json_name: "methodNames",
    deprecated: false
end

defmodule Envoy.Config.Core.V3.GrpcMethodList do
  @moduledoc """
  A list of gRPC methods which can be used as an allowlist, for example.
  [#protodoc-title: gRPC method list]
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.GrpcMethodList",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :services, 1, repeated: true, type: Envoy.Config.Core.V3.GrpcMethodList.Service
end

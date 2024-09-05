defmodule Envoy.Config.GrpcCredential.V3.AwsIamConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :service_name, 1, type: :string, json_name: "serviceName", deprecated: false
  field :region, 2, type: :string
end
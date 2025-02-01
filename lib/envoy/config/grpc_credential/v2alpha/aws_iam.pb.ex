defmodule Envoy.Config.GrpcCredential.V2alpha.AwsIamConfig do
  @moduledoc """
  [#protodoc-title: Grpc Credentials AWS IAM]
  Configuration for AWS IAM Grpc Credentials Plugin
  [#extension: envoy.grpc_credentials.aws_iam]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :service_name, 1, type: :string, json_name: "serviceName", deprecated: false
  field :region, 2, type: :string
end

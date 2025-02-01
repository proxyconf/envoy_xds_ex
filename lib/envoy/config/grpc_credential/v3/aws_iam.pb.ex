defmodule Envoy.Config.GrpcCredential.V3.AwsIamConfig do
  @moduledoc """
  [#protodoc-title: Grpc Credentials AWS IAM]
  Configuration for AWS IAM Grpc Credentials Plugin
  .. warning::

  This extension is deprecated and will be deleted in a future Envoy release, no
  later than Envoy 1.35, but possibly sooner.

  [#extension: envoy.grpc_credentials.aws_iam]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :service_name, 1, type: :string, json_name: "serviceName", deprecated: true
  field :region, 2, type: :string, deprecated: true
end

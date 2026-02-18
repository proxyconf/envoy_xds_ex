defmodule Envoy.Extensions.GrpcService.CallCredentials.GoogleIam.V3.GoogleIamCredentials do
  @moduledoc """
  [#not-implemented-hide:]
  [#protodoc-title: gRPC Google IAM Credentials]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.grpc_service.call_credentials.google_iam.v3.GoogleIamCredentials",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :authorization_token, 1, type: :string, json_name: "authorizationToken"
  field :authority_selector, 2, type: :string, json_name: "authoritySelector"
end

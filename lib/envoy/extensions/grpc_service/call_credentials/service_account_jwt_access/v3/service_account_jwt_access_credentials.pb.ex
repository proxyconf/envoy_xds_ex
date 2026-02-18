defmodule Envoy.Extensions.GrpcService.CallCredentials.ServiceAccountJwtAccess.V3.ServiceAccountJwtAccessCredentials do
  @moduledoc """
  [#not-implemented-hide:]
  [#protodoc-title: gRPC Service Account JWT Access Credentials]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.grpc_service.call_credentials.service_account_jwt_access.v3.ServiceAccountJwtAccessCredentials",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :json_key, 1, type: :string, json_name: "jsonKey"
  field :token_lifetime, 2, type: Google.Protobuf.Duration, json_name: "tokenLifetime"
end

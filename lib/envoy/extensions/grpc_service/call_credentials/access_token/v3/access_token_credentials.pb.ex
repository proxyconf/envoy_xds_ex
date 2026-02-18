defmodule Envoy.Extensions.GrpcService.CallCredentials.AccessToken.V3.AccessTokenCredentials do
  @moduledoc """
  [#not-implemented-hide:]
  [#protodoc-title: gRPC Access Token Credentials]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.grpc_service.call_credentials.access_token.v3.AccessTokenCredentials",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :token, 1, type: :string
end

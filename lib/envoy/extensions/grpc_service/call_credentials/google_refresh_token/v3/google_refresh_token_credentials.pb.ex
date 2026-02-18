defmodule Envoy.Extensions.GrpcService.CallCredentials.GoogleRefreshToken.V3.GoogleRefreshTokenCredentials do
  @moduledoc """
  [#not-implemented-hide:]
  [#protodoc-title: gRPC Google Refresh Token Credentials]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.grpc_service.call_credentials.google_refresh_token.v3.GoogleRefreshTokenCredentials",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :token, 1, type: :string
end

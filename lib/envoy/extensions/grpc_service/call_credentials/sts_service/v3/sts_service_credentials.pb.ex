defmodule Envoy.Extensions.GrpcService.CallCredentials.StsService.V3.StsServiceCredentials do
  @moduledoc """
  Security token service configuration that allows Google gRPC to
  fetch security token from an OAuth 2.0 authorization server.
  See https://tools.ietf.org/html/draft-ietf-oauth-token-exchange-16 and
  https://github.com/grpc/grpc/pull/19587.
  [#not-implemented-hide:]
  [#next-free-field: 10]
  [#protodoc-title: gRPC STS Credentials]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.grpc_service.call_credentials.sts_service.v3.StsServiceCredentials",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :token_exchange_service_uri, 1, type: :string, json_name: "tokenExchangeServiceUri"
  field :resource, 2, type: :string
  field :audience, 3, type: :string
  field :scope, 4, type: :string
  field :requested_token_type, 5, type: :string, json_name: "requestedTokenType"
  field :subject_token_path, 6, type: :string, json_name: "subjectTokenPath", deprecated: false
  field :subject_token_type, 7, type: :string, json_name: "subjectTokenType", deprecated: false
  field :actor_token_path, 8, type: :string, json_name: "actorTokenPath"
  field :actor_token_type, 9, type: :string, json_name: "actorTokenType"
end

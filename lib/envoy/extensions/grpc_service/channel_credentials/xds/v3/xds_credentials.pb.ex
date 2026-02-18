defmodule Envoy.Extensions.GrpcService.ChannelCredentials.Xds.V3.XdsCredentials do
  @moduledoc """
  [#not-implemented-hide:]
  [#protodoc-title: gRPC xDS Credentials]
  """

  use Protobuf,
    full_name: "envoy.extensions.grpc_service.channel_credentials.xds.v3.XdsCredentials",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :fallback_credentials, 1, type: Google.Protobuf.Any, json_name: "fallbackCredentials"
end

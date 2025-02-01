defmodule Envoy.Config.Core.V3.GrpcService.EnvoyGrpc do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cluster_name, 1, type: :string, json_name: "clusterName", deprecated: false
  field :authority, 2, type: :string, deprecated: false
  field :retry_policy, 3, type: Envoy.Config.Core.V3.RetryPolicy, json_name: "retryPolicy"

  field :max_receive_message_length, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxReceiveMessageLength"

  field :skip_envoy_headers, 5, type: :bool, json_name: "skipEnvoyHeaders"
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.SslCredentials do
  @moduledoc """
  See https://grpc.io/grpc/cpp/structgrpc_1_1_ssl_credentials_options.html.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :root_certs, 1, type: Envoy.Config.Core.V3.DataSource, json_name: "rootCerts"

  field :private_key, 2,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "privateKey",
    deprecated: false

  field :cert_chain, 3, type: Envoy.Config.Core.V3.DataSource, json_name: "certChain"
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.GoogleLocalCredentials do
  @moduledoc """
  Local channel credentials. Only UDS is supported for now.
  See https://github.com/grpc/grpc/pull/15909.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelCredentials do
  @moduledoc """
  See https://grpc.io/docs/guides/auth.html#credential-types to understand Channel and Call
  credential types.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :credential_specifier, 0

  field :ssl_credentials, 1,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.SslCredentials,
    json_name: "sslCredentials",
    oneof: 0

  field :google_default, 2, type: Google.Protobuf.Empty, json_name: "googleDefault", oneof: 0

  field :local_credentials, 3,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.GoogleLocalCredentials,
    json_name: "localCredentials",
    oneof: 0
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.ServiceAccountJWTAccessCredentials do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :json_key, 1, type: :string, json_name: "jsonKey"
  field :token_lifetime_seconds, 2, type: :uint64, json_name: "tokenLifetimeSeconds"
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.GoogleIAMCredentials do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :authorization_token, 1, type: :string, json_name: "authorizationToken"
  field :authority_selector, 2, type: :string, json_name: "authoritySelector"
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.MetadataCredentialsFromPlugin do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.StsService do
  @moduledoc """
  Security token service configuration that allows Google gRPC to
  fetch security token from an OAuth 2.0 authorization server.
  See https://tools.ietf.org/html/draft-ietf-oauth-token-exchange-16 and
  https://github.com/grpc/grpc/pull/19587.
  [#next-free-field: 10]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

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

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials do
  @moduledoc """
  [#next-free-field: 8]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :credential_specifier, 0

  field :access_token, 1, type: :string, json_name: "accessToken", oneof: 0

  field :google_compute_engine, 2,
    type: Google.Protobuf.Empty,
    json_name: "googleComputeEngine",
    oneof: 0

  field :google_refresh_token, 3, type: :string, json_name: "googleRefreshToken", oneof: 0

  field :service_account_jwt_access, 4,
    type:
      Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.ServiceAccountJWTAccessCredentials,
    json_name: "serviceAccountJwtAccess",
    oneof: 0

  field :google_iam, 5,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.GoogleIAMCredentials,
    json_name: "googleIam",
    oneof: 0

  field :from_plugin, 6,
    type:
      Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.MetadataCredentialsFromPlugin,
    json_name: "fromPlugin",
    oneof: 0

  field :sts_service, 7,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials.StsService,
    json_name: "stsService",
    oneof: 0
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs.Value do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :value_specifier, 0

  field :string_value, 1, type: :string, json_name: "stringValue", oneof: 0
  field :int_value, 2, type: :int64, json_name: "intValue", oneof: 0
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs.ArgsEntry do
  use Protobuf, map: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs.Value
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs do
  @moduledoc """
  Channel arguments.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :args, 1,
    repeated: true,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs.ArgsEntry,
    map: true
end

defmodule Envoy.Config.Core.V3.GrpcService.GoogleGrpc do
  @moduledoc """
  [#next-free-field: 9]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :target_uri, 1, type: :string, json_name: "targetUri", deprecated: false

  field :channel_credentials, 2,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelCredentials,
    json_name: "channelCredentials"

  field :call_credentials, 3,
    repeated: true,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.CallCredentials,
    json_name: "callCredentials"

  field :stat_prefix, 4, type: :string, json_name: "statPrefix", deprecated: false
  field :credentials_factory_name, 5, type: :string, json_name: "credentialsFactoryName"
  field :config, 6, type: Google.Protobuf.Struct

  field :per_stream_buffer_limit_bytes, 7,
    type: Google.Protobuf.UInt32Value,
    json_name: "perStreamBufferLimitBytes"

  field :channel_args, 8,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc.ChannelArgs,
    json_name: "channelArgs"
end

defmodule Envoy.Config.Core.V3.GrpcService do
  @moduledoc """
  gRPC service configuration. This is used by :ref:`ApiConfigSource
  <envoy_v3_api_msg_config.core.v3.ApiConfigSource>` and filter configurations.
  [#next-free-field: 7]
  [#protodoc-title: gRPC services]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :target_specifier, 0

  field :envoy_grpc, 1,
    type: Envoy.Config.Core.V3.GrpcService.EnvoyGrpc,
    json_name: "envoyGrpc",
    oneof: 0

  field :google_grpc, 2,
    type: Envoy.Config.Core.V3.GrpcService.GoogleGrpc,
    json_name: "googleGrpc",
    oneof: 0

  field :timeout, 3, type: Google.Protobuf.Duration

  field :initial_metadata, 5,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValue,
    json_name: "initialMetadata"

  field :retry_policy, 6, type: Envoy.Config.Core.V3.RetryPolicy, json_name: "retryPolicy"
end

defmodule Envoy.Service.RedisAuth.V3.RedisProxyExternalAuthRequest do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :username, 1, type: :string
  field :password, 2, type: :string
end

defmodule Envoy.Service.RedisAuth.V3.RedisProxyExternalAuthResponse do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :status, 1, type: Google.Rpc.Status
  field :expiration, 2, type: Google.Protobuf.Timestamp
  field :message, 3, type: :string
end

defmodule Envoy.Service.RedisAuth.V3.RedisProxyExternalAuth.Service do
  @moduledoc """
  A generic interface for performing external password authentication on incoming AUTH commands.
  [#protodoc-title: Redis external authentication service]
  The messages used by the redis_proxy filter when performing external authentication.
  """

  use GRPC.Service,
    name: "envoy.service.redis_auth.v3.RedisProxyExternalAuth",
    protoc_gen_elixir_version: "0.14.0"

  rpc :Authenticate,
      Envoy.Service.RedisAuth.V3.RedisProxyExternalAuthRequest,
      Envoy.Service.RedisAuth.V3.RedisProxyExternalAuthResponse
end

defmodule Envoy.Service.RedisAuth.V3.RedisProxyExternalAuth.Stub do
  use GRPC.Stub, service: Envoy.Service.RedisAuth.V3.RedisProxyExternalAuth.Service
end

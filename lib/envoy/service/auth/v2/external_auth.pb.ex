defmodule Envoy.Service.Auth.V2.CheckRequest do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :attributes, 1, type: Envoy.Service.Auth.V2.AttributeContext
end

defmodule Envoy.Service.Auth.V2.DeniedHttpResponse do
  @moduledoc """
  HTTP attributes for a denied response.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :status, 1, type: Envoy.Type.HttpStatus, deprecated: false
  field :headers, 2, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption
  field :body, 3, type: :string
end

defmodule Envoy.Service.Auth.V2.OkHttpResponse do
  @moduledoc """
  HTTP attributes for an ok response.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :headers, 2, repeated: true, type: Envoy.Api.V2.Core.HeaderValueOption
end

defmodule Envoy.Service.Auth.V2.CheckResponse do
  @moduledoc """
  Intended for gRPC and Network Authorization servers `only`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :http_response, 0

  field :status, 1, type: Google.Rpc.Status

  field :denied_response, 2,
    type: Envoy.Service.Auth.V2.DeniedHttpResponse,
    json_name: "deniedResponse",
    oneof: 0

  field :ok_response, 3,
    type: Envoy.Service.Auth.V2.OkHttpResponse,
    json_name: "okResponse",
    oneof: 0
end

defmodule Envoy.Service.Auth.V2.Authorization.Service do
  @moduledoc """
  A generic interface for performing authorization check on incoming
  requests to a networked service.
  [#protodoc-title: Authorization Service ]
  The authorization service request messages used by external authorization :ref:`network filter
  <config_network_filters_ext_authz>` and :ref:`HTTP filter <config_http_filters_ext_authz>`.
  """

  use GRPC.Service,
    name: "envoy.service.auth.v2.Authorization",
    protoc_gen_elixir_version: "0.14.0"

  rpc :Check, Envoy.Service.Auth.V2.CheckRequest, Envoy.Service.Auth.V2.CheckResponse
end

defmodule Envoy.Service.Auth.V2.Authorization.Stub do
  use GRPC.Stub, service: Envoy.Service.Auth.V2.Authorization.Service
end

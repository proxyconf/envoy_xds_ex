defmodule Envoy.Service.Auth.V3.CheckRequest do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :attributes, 1, type: Envoy.Service.Auth.V3.AttributeContext
end

defmodule Envoy.Service.Auth.V3.DeniedHttpResponse do
  @moduledoc """
  HTTP attributes for a denied response.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :status, 1, type: Envoy.Type.V3.HttpStatus
  field :headers, 2, repeated: true, type: Envoy.Config.Core.V3.HeaderValueOption
  field :body, 3, type: :string
end

defmodule Envoy.Service.Auth.V3.OkHttpResponse do
  @moduledoc """
  HTTP attributes for an OK response.
  [#next-free-field: 9]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :headers, 2, repeated: true, type: Envoy.Config.Core.V3.HeaderValueOption
  field :headers_to_remove, 5, repeated: true, type: :string, json_name: "headersToRemove"

  field :dynamic_metadata, 3,
    type: Google.Protobuf.Struct,
    json_name: "dynamicMetadata",
    deprecated: true

  field :response_headers_to_add, 6,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd"

  field :query_parameters_to_set, 7,
    repeated: true,
    type: Envoy.Config.Core.V3.QueryParameter,
    json_name: "queryParametersToSet"

  field :query_parameters_to_remove, 8,
    repeated: true,
    type: :string,
    json_name: "queryParametersToRemove"
end

defmodule Envoy.Service.Auth.V3.CheckResponse do
  @moduledoc """
  Intended for gRPC and Network Authorization servers ``only``.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :http_response, 0

  field :status, 1, type: Google.Rpc.Status

  field :denied_response, 2,
    type: Envoy.Service.Auth.V3.DeniedHttpResponse,
    json_name: "deniedResponse",
    oneof: 0

  field :ok_response, 3,
    type: Envoy.Service.Auth.V3.OkHttpResponse,
    json_name: "okResponse",
    oneof: 0

  field :dynamic_metadata, 4, type: Google.Protobuf.Struct, json_name: "dynamicMetadata"
end

defmodule Envoy.Service.Auth.V3.Authorization.Service do
  @moduledoc """
  A generic interface for performing authorization check on incoming
  requests to a networked service.
  [#protodoc-title: Authorization service]
  The authorization service request messages used by external authorization :ref:`network filter
  <config_network_filters_ext_authz>` and :ref:`HTTP filter <config_http_filters_ext_authz>`.
  """

  use GRPC.Service,
    name: "envoy.service.auth.v3.Authorization",
    protoc_gen_elixir_version: "0.14.0"

  rpc :Check, Envoy.Service.Auth.V3.CheckRequest, Envoy.Service.Auth.V3.CheckResponse
end

defmodule Envoy.Service.Auth.V3.Authorization.Stub do
  use GRPC.Stub, service: Envoy.Service.Auth.V3.Authorization.Service
end

defmodule Envoy.Service.Auth.V2alpha.Authorization.Service do
  @moduledoc """
  A generic interface for performing authorization check on incoming
  requests to a networked service.
  [#protodoc-title: Authorization Service ]
  The authorization service request messages used by external authorization :ref:`network filter
  <config_network_filters_ext_authz>` and :ref:`HTTP filter <config_http_filters_ext_authz>`.
  """

  use GRPC.Service,
    name: "envoy.service.auth.v2alpha.Authorization",
    protoc_gen_elixir_version: "0.14.0"

  rpc :Check, Envoy.Service.Auth.V2.CheckRequest, Envoy.Service.Auth.V2.CheckResponse
end

defmodule Envoy.Service.Auth.V2alpha.Authorization.Stub do
  use GRPC.Stub, service: Envoy.Service.Auth.V2alpha.Authorization.Service
end

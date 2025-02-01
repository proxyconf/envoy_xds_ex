defmodule Envoy.Api.V2.LdsDummy do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue with importing
  services: https://github.com/google/protobuf/issues/4221 and protoxform to upgrade the file.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Api.V2.ListenerDiscoveryService.Service do
  @moduledoc """
  The Envoy instance initiates an RPC at startup to discover a list of
  listeners. Updates are delivered via streaming from the LDS server and
  consist of a complete update of all listeners. Existing connections will be
  allowed to drain from listeners that are no longer present.
  [#protodoc-title: Listener]
  Listener :ref:`configuration overview <config_listeners>`
  """

  use GRPC.Service,
    name: "envoy.api.v2.ListenerDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :DeltaListeners,
      stream(Envoy.Api.V2.DeltaDiscoveryRequest),
      stream(Envoy.Api.V2.DeltaDiscoveryResponse)

  rpc :StreamListeners,
      stream(Envoy.Api.V2.DiscoveryRequest),
      stream(Envoy.Api.V2.DiscoveryResponse)

  rpc :FetchListeners, Envoy.Api.V2.DiscoveryRequest, Envoy.Api.V2.DiscoveryResponse
end

defmodule Envoy.Api.V2.ListenerDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Api.V2.ListenerDiscoveryService.Service
end

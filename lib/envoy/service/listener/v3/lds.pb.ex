defmodule Envoy.Service.Listener.V3.LdsDummy do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue with importing
  services: https://github.com/google/protobuf/issues/4221 and protoxform to upgrade the file.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Service.Listener.V3.ListenerDiscoveryService.Service do
  @moduledoc """
  The Envoy instance initiates an RPC at startup to discover a list of
  listeners. Updates are delivered via streaming from the LDS server and
  consist of a complete update of all listeners. Existing connections will be
  allowed to drain from listeners that are no longer present.
  [#protodoc-title: Listener]
  Listener :ref:`configuration overview <config_listeners>`
  """

  use GRPC.Service,
    name: "envoy.service.listener.v3.ListenerDiscoveryService",
    protoc_gen_elixir_version: "0.14.0"

  rpc :DeltaListeners,
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DeltaDiscoveryResponse)

  rpc :StreamListeners,
      stream(Envoy.Service.Discovery.V3.DiscoveryRequest),
      stream(Envoy.Service.Discovery.V3.DiscoveryResponse)

  rpc :FetchListeners,
      Envoy.Service.Discovery.V3.DiscoveryRequest,
      Envoy.Service.Discovery.V3.DiscoveryResponse
end

defmodule Envoy.Service.Listener.V3.ListenerDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Listener.V3.ListenerDiscoveryService.Service
end

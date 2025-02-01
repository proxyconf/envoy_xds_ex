defmodule Envoy.Api.V2.Listener.UdpListenerConfig do
  @moduledoc """
  [#protodoc-title: UDP Listener Config]
  Listener :ref:`configuration overview <config_listeners>`
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_type, 0

  field :udp_listener_name, 1, type: :string, json_name: "udpListenerName"
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Api.V2.Listener.ActiveRawUdpListenerConfig do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

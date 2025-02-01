defmodule Envoy.Extensions.Network.SocketInterface.V3.DefaultSocketInterface do
  @moduledoc """
  Configuration for default socket interface that relies on OS dependent syscall to create
  sockets.
  [#protodoc-title: Default socket interface configuration]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

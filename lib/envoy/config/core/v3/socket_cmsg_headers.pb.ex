defmodule Envoy.Config.Core.V3.SocketCmsgHeaders do
  @moduledoc """
  Configuration for socket cmsg headers.
  See `:ref:CMSG <https://man7.org/linux/man-pages/man3/cmsg.3.html>`_ for further information.
  [#protodoc-title: Socket CMSG headers]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :level, 1, type: Google.Protobuf.UInt32Value
  field :type, 2, type: Google.Protobuf.UInt32Value
  field :expected_size, 3, type: :uint32, json_name: "expectedSize"
end

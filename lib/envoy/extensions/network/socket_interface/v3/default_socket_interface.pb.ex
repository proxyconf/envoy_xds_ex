defmodule Envoy.Extensions.Network.SocketInterface.V3.DefaultSocketInterface do
  @moduledoc """
  Configuration for default socket interface that relies on OS dependent syscall to create
  sockets.
  [#protodoc-title: Default socket interface configuration]
  """

  use Protobuf,
    full_name: "envoy.extensions.network.socket_interface.v3.DefaultSocketInterface",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :io_uring_options, 1,
    type: Envoy.Extensions.Network.SocketInterface.V3.IoUringOptions,
    json_name: "ioUringOptions"
end

defmodule Envoy.Extensions.Network.SocketInterface.V3.IoUringOptions do
  use Protobuf,
    full_name: "envoy.extensions.network.socket_interface.v3.IoUringOptions",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :io_uring_size, 1, type: Google.Protobuf.UInt32Value, json_name: "ioUringSize"

  field :enable_submission_queue_polling, 2,
    type: :bool,
    json_name: "enableSubmissionQueuePolling"

  field :read_buffer_size, 3, type: Google.Protobuf.UInt32Value, json_name: "readBufferSize"
  field :write_timeout_ms, 4, type: Google.Protobuf.UInt32Value, json_name: "writeTimeoutMs"
end

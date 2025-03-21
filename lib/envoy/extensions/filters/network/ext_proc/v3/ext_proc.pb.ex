defmodule Envoy.Extensions.Filters.Network.ExtProc.V3.ProcessingMode.DataSendMode do
  @moduledoc """
  Defines how traffic should be handled by the external processor.
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :STREAMED, 0
  field :SKIP, 1
end

defmodule Envoy.Extensions.Filters.Network.ExtProc.V3.NetworkExternalProcessor do
  @moduledoc """
  The Network External Processing filter allows an external service to process raw TCP/UDP traffic
  in a flexible way using a bidirectional gRPC stream. Unlike the HTTP External Processing filter,
  this filter operates at the L4 (transport) layer, giving access to raw network traffic.

  The filter communicates with an external gRPC service that can:
  * Inspect traffic in both directions
  * Modify the network traffic
  * Control connection lifecycle (continue, close, or reset)

  By using the filter's processing mode, you can selectively choose which data
  directions to process (read, write or both), allowing for efficient processing.
  [#protodoc-title: External Processing Filter]
  [#not-implemented-hide:]
  External Processing Filter: Process network traffic using an external service.
  [#extension: envoy.filters.network.ext_proc]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :grpc_service, 1, type: Envoy.Config.Core.V3.GrpcService, json_name: "grpcService"
  field :failure_mode_allow, 2, type: :bool, json_name: "failureModeAllow"

  field :processing_mode, 3,
    type: Envoy.Extensions.Filters.Network.ExtProc.V3.ProcessingMode,
    json_name: "processingMode"

  field :message_timeout, 4,
    type: Google.Protobuf.Duration,
    json_name: "messageTimeout",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.ExtProc.V3.ProcessingMode do
  @moduledoc """
  Options for controlling processing behavior.
  Filter will reject the config if both read and write are SKIP mode.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :process_read, 1,
    type: Envoy.Extensions.Filters.Network.ExtProc.V3.ProcessingMode.DataSendMode,
    json_name: "processRead",
    enum: true

  field :process_write, 2,
    type: Envoy.Extensions.Filters.Network.ExtProc.V3.ProcessingMode.DataSendMode,
    json_name: "processWrite",
    enum: true
end

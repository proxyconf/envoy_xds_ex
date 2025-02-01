defmodule Envoy.Extensions.Common.AsyncFiles.V3.AsyncFileManagerConfig.ThreadPool do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :thread_count, 1, type: :uint32, json_name: "threadCount", deprecated: false
end

defmodule Envoy.Extensions.Common.AsyncFiles.V3.AsyncFileManagerConfig do
  @moduledoc """
  Configuration to instantiate or select a singleton ``AsyncFileManager``.
  [#protodoc-title: AsyncFileManager configuration]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :manager_type, 0

  field :id, 1, type: :string

  field :thread_pool, 2,
    type: Envoy.Extensions.Common.AsyncFiles.V3.AsyncFileManagerConfig.ThreadPool,
    json_name: "threadPool",
    oneof: 0
end

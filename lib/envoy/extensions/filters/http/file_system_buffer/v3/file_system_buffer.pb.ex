defmodule Envoy.Extensions.Filters.Http.FileSystemBuffer.V3.BufferBehavior.StreamWhenPossible do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Http.FileSystemBuffer.V3.BufferBehavior.Bypass do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Http.FileSystemBuffer.V3.BufferBehavior.InjectContentLengthIfNecessary do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Http.FileSystemBuffer.V3.BufferBehavior.FullyBufferAndAlwaysInjectContentLength do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Http.FileSystemBuffer.V3.BufferBehavior.FullyBuffer do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Http.FileSystemBuffer.V3.BufferBehavior do
  @moduledoc """
  The behavior of the filter for a stream.
  [#next-free-field: 6]
  [#protodoc-title: FileSystemBufferFilterConfig]
  [#extension: envoy.filters.http.file_system_buffer]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :behavior, 0

  field :stream_when_possible, 1,
    type: Envoy.Extensions.Filters.Http.FileSystemBuffer.V3.BufferBehavior.StreamWhenPossible,
    json_name: "streamWhenPossible",
    oneof: 0

  field :bypass, 2,
    type: Envoy.Extensions.Filters.Http.FileSystemBuffer.V3.BufferBehavior.Bypass,
    oneof: 0

  field :inject_content_length_if_necessary, 3,
    type:
      Envoy.Extensions.Filters.Http.FileSystemBuffer.V3.BufferBehavior.InjectContentLengthIfNecessary,
    json_name: "injectContentLengthIfNecessary",
    oneof: 0

  field :fully_buffer_and_always_inject_content_length, 4,
    type:
      Envoy.Extensions.Filters.Http.FileSystemBuffer.V3.BufferBehavior.FullyBufferAndAlwaysInjectContentLength,
    json_name: "fullyBufferAndAlwaysInjectContentLength",
    oneof: 0

  field :fully_buffer, 5,
    type: Envoy.Extensions.Filters.Http.FileSystemBuffer.V3.BufferBehavior.FullyBuffer,
    json_name: "fullyBuffer",
    oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.FileSystemBuffer.V3.StreamConfig do
  @moduledoc """
  The configuration for one direction of the filter behavior.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :behavior, 1, type: Envoy.Extensions.Filters.Http.FileSystemBuffer.V3.BufferBehavior

  field :memory_buffer_bytes_limit, 2,
    type: Google.Protobuf.UInt64Value,
    json_name: "memoryBufferBytesLimit",
    deprecated: false

  field :storage_buffer_bytes_limit, 3,
    type: Google.Protobuf.UInt64Value,
    json_name: "storageBufferBytesLimit"

  field :storage_buffer_queue_high_watermark_bytes, 4,
    type: Google.Protobuf.UInt64Value,
    json_name: "storageBufferQueueHighWatermarkBytes"
end

defmodule Envoy.Extensions.Filters.Http.FileSystemBuffer.V3.FileSystemBufferFilterConfig do
  @moduledoc """
  A :ref:`file system buffer <config_http_filters_file_system_buffer>` filter configuration.

  Route-specific configs override only the fields they explicitly include; unset
  fields inherit from the vhost or listener-level config, or, if never set,
  and not required, use a default value.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :manager_config, 1,
    type: Envoy.Extensions.Common.AsyncFiles.V3.AsyncFileManagerConfig,
    json_name: "managerConfig"

  field :storage_buffer_path, 2, type: Google.Protobuf.StringValue, json_name: "storageBufferPath"
  field :request, 3, type: Envoy.Extensions.Filters.Http.FileSystemBuffer.V3.StreamConfig
  field :response, 4, type: Envoy.Extensions.Filters.Http.FileSystemBuffer.V3.StreamConfig
end

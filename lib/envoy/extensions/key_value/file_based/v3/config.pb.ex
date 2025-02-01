defmodule Envoy.Extensions.KeyValue.FileBased.V3.FileBasedKeyValueStoreConfig do
  @moduledoc """
  [#extension: envoy.key_value.file_based]
  This is configuration to flush a key value store out to disk.
  [#protodoc-title: Key/value file-based store storage plugin]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :filename, 1, type: :string, deprecated: false
  field :flush_interval, 2, type: Google.Protobuf.Duration, json_name: "flushInterval"
  field :max_entries, 3, type: Google.Protobuf.UInt32Value, json_name: "maxEntries"
end

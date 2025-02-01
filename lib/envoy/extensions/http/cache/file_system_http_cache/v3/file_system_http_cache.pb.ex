defmodule Envoy.Extensions.Http.Cache.FileSystemHttpCache.V3.FileSystemHttpCacheConfig do
  @moduledoc """
  Configuration for a cache implementation that caches in the local file system.

  By default this cache uses a least-recently-used eviction strategy.

  For implementation details, see `DESIGN.md <https://github.com/envoyproxy/envoy/blob/main/source/extensions/http/cache/file_system_http_cache/DESIGN.md>`_.
  [#next-free-field: 11]
  [#protodoc-title: FileSystemHttpCacheConfig]
  [#extension: envoy.extensions.http.cache.file_system_http_cache]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :manager_config, 1,
    type: Envoy.Extensions.Common.AsyncFiles.V3.AsyncFileManagerConfig,
    json_name: "managerConfig",
    deprecated: false

  field :cache_path, 2, type: :string, json_name: "cachePath", deprecated: false

  field :max_cache_size_bytes, 3,
    type: Google.Protobuf.UInt64Value,
    json_name: "maxCacheSizeBytes"

  field :max_individual_cache_entry_size_bytes, 4,
    type: Google.Protobuf.UInt64Value,
    json_name: "maxIndividualCacheEntrySizeBytes"

  field :max_cache_entry_count, 5,
    type: Google.Protobuf.UInt64Value,
    json_name: "maxCacheEntryCount"

  field :cache_subdivisions, 6, type: :uint32, json_name: "cacheSubdivisions"
  field :evict_fraction, 7, type: :float, json_name: "evictFraction"
  field :max_eviction_period, 8, type: Google.Protobuf.Duration, json_name: "maxEvictionPeriod"
  field :min_eviction_period, 9, type: Google.Protobuf.Duration, json_name: "minEvictionPeriod"
  field :create_cache_path, 10, type: :bool, json_name: "createCachePath"
end

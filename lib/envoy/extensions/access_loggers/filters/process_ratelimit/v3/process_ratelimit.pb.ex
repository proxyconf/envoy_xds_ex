defmodule Envoy.Extensions.AccessLoggers.Filters.ProcessRatelimit.V3.ProcessRateLimitFilter do
  @moduledoc """
  Filters for rate limiting the access log emission using global token buckets per process and shared across all listeners.
  [#protodoc-title: ProcessRateLimiter]
  [#extension: envoy.access_loggers.extension_filters.process_ratelimit]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.access_loggers.filters.process_ratelimit.v3.ProcessRateLimitFilter",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :dynamic_config, 1,
    type: Envoy.Extensions.AccessLoggers.Filters.ProcessRatelimit.V3.DynamicTokenBucket,
    json_name: "dynamicConfig"
end

defmodule Envoy.Extensions.AccessLoggers.Filters.ProcessRatelimit.V3.DynamicTokenBucket do
  use Protobuf,
    full_name: "envoy.extensions.access_loggers.filters.process_ratelimit.v3.DynamicTokenBucket",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :resource_name, 1, type: :string, json_name: "resourceName", deprecated: false

  field :config_source, 2,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "configSource",
    deprecated: false
end

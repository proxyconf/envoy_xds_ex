defmodule Envoy.Extensions.Tracers.Fluentd.V3.FluentdConfig do
  @moduledoc """
  Configuration for the Fluentd tracer.
  This tracer extension will send the emitted traces over a TCP connection to an upstream that is accepting
  the Fluentd Forward Protocol as described in: `Fluentd Forward Protocol Specification
  <https://github.com/fluent/fluentd/wiki/Forward-Protocol-Specification-v1>`_.
  [#extension: envoy.tracers.fluentd]
  [#next-free-field: 7]
  [#protodoc-title: Fluentd tracer]
  """

  use Protobuf,
    full_name: "envoy.extensions.tracers.fluentd.v3.FluentdConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :cluster, 1, type: :string, deprecated: false
  field :tag, 2, type: :string, deprecated: false
  field :stat_prefix, 3, type: :string, json_name: "statPrefix", deprecated: false

  field :buffer_flush_interval, 4,
    type: Google.Protobuf.Duration,
    json_name: "bufferFlushInterval",
    deprecated: false

  field :buffer_size_bytes, 5, type: Google.Protobuf.UInt32Value, json_name: "bufferSizeBytes"
  field :retry_policy, 6, type: Envoy.Config.Core.V3.RetryPolicy, json_name: "retryPolicy"
end

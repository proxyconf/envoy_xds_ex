defmodule Envoy.Extensions.StatSinks.GraphiteStatsd.V3.GraphiteStatsdSink do
  @moduledoc """
  [#protodoc-title: Graphite+Statsd]
  Stats configuration proto schema for ``envoy.stat_sinks.graphite_statsd`` sink.
  The sink emits stats with `Graphite <https://graphite.readthedocs.io/en/latest/tags.html>`_
  compatible tags. Tags are configurable via :ref:`StatsConfig
  <envoy_v3_api_msg_config.metrics.v3.StatsConfig>`.
  [#extension: envoy.stat_sinks.graphite_statsd]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :statsd_specifier, 0

  field :address, 1, type: Envoy.Config.Core.V3.Address, oneof: 0
  field :prefix, 3, type: :string

  field :max_bytes_per_datagram, 4,
    type: Google.Protobuf.UInt64Value,
    json_name: "maxBytesPerDatagram",
    deprecated: false
end

defmodule Envoy.Extensions.AccessLoggers.Stats.V3.Config.Histogram.Unit do
  @moduledoc """
  The histogram units. The units are needed for some stat sinks.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.access_loggers.stats.v3.Config.Histogram.Unit",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :Unspecified, 0
  field :Bytes, 1
  field :Microseconds, 2
  field :Milliseconds, 3
  field :Percent, 4
end

defmodule Envoy.Extensions.AccessLoggers.Stats.V3.Config.Tag do
  @moduledoc """
  Defines a tag on a stat.
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.stats.v3.Config.Tag",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :value_format, 2, type: :string, json_name: "valueFormat", deprecated: false
end

defmodule Envoy.Extensions.AccessLoggers.Stats.V3.Config.Stat do
  @moduledoc """
  Defines the name and tags of a stat.
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.stats.v3.Config.Stat",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :tags, 2, repeated: true, type: Envoy.Extensions.AccessLoggers.Stats.V3.Config.Tag
end

defmodule Envoy.Extensions.AccessLoggers.Stats.V3.Config.Histogram do
  @moduledoc """
  Configuration for a histogram stat.
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.stats.v3.Config.Histogram",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :stat, 1, type: Envoy.Extensions.AccessLoggers.Stats.V3.Config.Stat, deprecated: false

  field :unit, 2,
    type: Envoy.Extensions.AccessLoggers.Stats.V3.Config.Histogram.Unit,
    enum: true,
    deprecated: false

  field :value_format, 3, type: :string, json_name: "valueFormat", deprecated: false
end

defmodule Envoy.Extensions.AccessLoggers.Stats.V3.Config.Counter do
  @moduledoc """
  Configuration for a counter stat.
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.stats.v3.Config.Counter",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :stat, 1, type: Envoy.Extensions.AccessLoggers.Stats.V3.Config.Stat, deprecated: false
  field :value_format, 2, type: :string, json_name: "valueFormat", deprecated: false

  field :value_fixed, 3,
    type: Google.Protobuf.UInt64Value,
    json_name: "valueFixed",
    deprecated: false
end

defmodule Envoy.Extensions.AccessLoggers.Stats.V3.Config do
  @moduledoc """
  [#protodoc-title: Stats logger]
  Configuration for an access logger that emits custom Envoy stats according to its
  configuration. The stats can have tags and values derived from
  :ref:`command operators <config_access_log_command_operators>`.
  [#extension: envoy.access_loggers.stats]

  .. warning::
    It is easy to configure and use this extension in ways that create very
    large numbers of stats in Envoy, which can cause excessive memory or CPU use
    leading to a denial of service in Envoy, or can overwhelm any configured
    stat sinks by sending too many unique metrics.
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.stats.v3.Config",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :histograms, 3,
    repeated: true,
    type: Envoy.Extensions.AccessLoggers.Stats.V3.Config.Histogram

  field :counters, 4, repeated: true, type: Envoy.Extensions.AccessLoggers.Stats.V3.Config.Counter
end

defmodule Io.Prometheus.Client.MetricType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :COUNTER, 0
  field :GAUGE, 1
  field :SUMMARY, 2
  field :UNTYPED, 3
  field :HISTOGRAM, 4
end

defmodule Io.Prometheus.Client.LabelPair do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :name, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :string
end

defmodule Io.Prometheus.Client.Gauge do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :value, 1, optional: true, type: :double
end

defmodule Io.Prometheus.Client.Counter do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :value, 1, optional: true, type: :double
  field :exemplar, 2, optional: true, type: Io.Prometheus.Client.Exemplar
end

defmodule Io.Prometheus.Client.Quantile do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :quantile, 1, optional: true, type: :double
  field :value, 2, optional: true, type: :double
end

defmodule Io.Prometheus.Client.Summary do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :sample_count, 1, optional: true, type: :uint64, json_name: "sampleCount"
  field :sample_sum, 2, optional: true, type: :double, json_name: "sampleSum"
  field :quantile, 3, repeated: true, type: Io.Prometheus.Client.Quantile
end

defmodule Io.Prometheus.Client.Untyped do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :value, 1, optional: true, type: :double
end

defmodule Io.Prometheus.Client.Histogram do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :sample_count, 1, optional: true, type: :uint64, json_name: "sampleCount"
  field :sample_sum, 2, optional: true, type: :double, json_name: "sampleSum"
  field :bucket, 3, repeated: true, type: Io.Prometheus.Client.Bucket
end

defmodule Io.Prometheus.Client.Bucket do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :cumulative_count, 1, optional: true, type: :uint64, json_name: "cumulativeCount"
  field :upper_bound, 2, optional: true, type: :double, json_name: "upperBound"
  field :exemplar, 3, optional: true, type: Io.Prometheus.Client.Exemplar
end

defmodule Io.Prometheus.Client.Exemplar do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :label, 1, repeated: true, type: Io.Prometheus.Client.LabelPair
  field :value, 2, optional: true, type: :double
  field :timestamp, 3, optional: true, type: Google.Protobuf.Timestamp
end

defmodule Io.Prometheus.Client.Metric do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :label, 1, repeated: true, type: Io.Prometheus.Client.LabelPair
  field :gauge, 2, optional: true, type: Io.Prometheus.Client.Gauge
  field :counter, 3, optional: true, type: Io.Prometheus.Client.Counter
  field :summary, 4, optional: true, type: Io.Prometheus.Client.Summary
  field :untyped, 5, optional: true, type: Io.Prometheus.Client.Untyped
  field :histogram, 7, optional: true, type: Io.Prometheus.Client.Histogram
  field :timestamp_ms, 6, optional: true, type: :int64, json_name: "timestampMs"
end

defmodule Io.Prometheus.Client.MetricFamily do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto2

  field :name, 1, optional: true, type: :string
  field :help, 2, optional: true, type: :string
  field :type, 3, optional: true, type: Io.Prometheus.Client.MetricType, enum: true
  field :metric, 4, repeated: true, type: Io.Prometheus.Client.Metric
end

defmodule Envoy.Extensions.OutlierDetectionMonitors.ConsecutiveErrors.V3.ConsecutiveErrors do
  @moduledoc """
  Monitor which counts consecutive errors.
  If number of consecutive errors exceeds the threshold, monitor will report that the host
  is unhealthy.
  [#not-implemented-hide:]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string
  field :threshold, 2, type: Google.Protobuf.UInt32Value, deprecated: false
  field :enforcing, 3, type: Google.Protobuf.UInt32Value, deprecated: false

  field :error_buckets, 4,
    type: Envoy.Extensions.OutlierDetectionMonitors.Common.V3.ErrorBuckets,
    json_name: "errorBuckets"
end

defmodule Envoy.Extensions.Tracers.Opentelemetry.Samplers.V3.DynatraceSamplerConfig do
  @moduledoc """
  Configuration for the Dynatrace Sampler extension.
  [#extension: envoy.tracers.opentelemetry.samplers.dynatrace]
  [#protodoc-title: Dynatrace Sampler config]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :tenant, 1, type: :string
  field :cluster_id, 2, type: :int32, json_name: "clusterId"
  field :http_service, 3, type: Envoy.Config.Core.V3.HttpService, json_name: "httpService"
  field :root_spans_per_minute, 4, type: :uint32, json_name: "rootSpansPerMinute"
end

defmodule Envoy.Config.Trace.V3.DatadogRemoteConfig do
  @moduledoc """
  Configuration for the Remote Configuration feature.
  [#protodoc-title: Datadog tracer]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :polling_interval, 1, type: Google.Protobuf.Duration, json_name: "pollingInterval"
end

defmodule Envoy.Config.Trace.V3.DatadogConfig do
  @moduledoc """
  Configuration for the Datadog tracer.
  [#extension: envoy.tracers.datadog]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :collector_cluster, 1, type: :string, json_name: "collectorCluster", deprecated: false
  field :service_name, 2, type: :string, json_name: "serviceName", deprecated: false
  field :collector_hostname, 3, type: :string, json_name: "collectorHostname"

  field :remote_config, 4,
    type: Envoy.Config.Trace.V3.DatadogRemoteConfig,
    json_name: "remoteConfig"
end

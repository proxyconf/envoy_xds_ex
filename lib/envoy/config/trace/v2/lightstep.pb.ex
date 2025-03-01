defmodule Envoy.Config.Trace.V2.LightstepConfig.PropagationMode do
  @moduledoc """
  Available propagation modes
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ENVOY, 0
  field :LIGHTSTEP, 1
  field :B3, 2
  field :TRACE_CONTEXT, 3
end

defmodule Envoy.Config.Trace.V2.LightstepConfig do
  @moduledoc """
  Configuration for the LightStep tracer.
  [#extension: envoy.tracers.lightstep]
  [#protodoc-title: LightStep tracer]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :collector_cluster, 1, type: :string, json_name: "collectorCluster", deprecated: false
  field :access_token_file, 2, type: :string, json_name: "accessTokenFile", deprecated: false

  field :propagation_modes, 3,
    repeated: true,
    type: Envoy.Config.Trace.V2.LightstepConfig.PropagationMode,
    json_name: "propagationModes",
    enum: true,
    deprecated: false
end

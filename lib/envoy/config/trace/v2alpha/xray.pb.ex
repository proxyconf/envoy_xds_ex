defmodule Envoy.Config.Trace.V2alpha.XRayConfig do
  @moduledoc """
  [#protodoc-title: AWS X-Ray Tracer Configuration]
  Configuration for AWS X-Ray tracer
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :daemon_endpoint, 1, type: Envoy.Api.V2.Core.SocketAddress, json_name: "daemonEndpoint"
  field :segment_name, 2, type: :string, json_name: "segmentName", deprecated: false

  field :sampling_rule_manifest, 3,
    type: Envoy.Api.V2.Core.DataSource,
    json_name: "samplingRuleManifest"
end

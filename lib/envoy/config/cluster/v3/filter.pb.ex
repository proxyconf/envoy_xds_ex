defmodule Envoy.Config.Cluster.V3.Filter do
  @moduledoc """
  [#protodoc-title: Upstream network filters]
  Upstream network filters apply to the connections to the upstream cluster hosts.
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Filter",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 2, type: Google.Protobuf.Any, json_name: "typedConfig"

  field :config_discovery, 3,
    type: Envoy.Config.Core.V3.ExtensionConfigSource,
    json_name: "configDiscovery"
end

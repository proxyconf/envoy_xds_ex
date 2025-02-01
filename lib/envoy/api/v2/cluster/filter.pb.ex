defmodule Envoy.Api.V2.Cluster.Filter do
  @moduledoc """
  [#protodoc-title: Upstream filters]
  Upstream filters apply to the connections to the upstream cluster hosts.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 2, type: Google.Protobuf.Any, json_name: "typedConfig"
end

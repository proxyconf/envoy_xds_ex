defmodule Envoy.Config.Filter.Network.MongoProxy.V2.MongoProxy do
  @moduledoc """
  [#protodoc-title: Mongo proxy]
  MongoDB :ref:`configuration overview <config_network_filters_mongo_proxy>`.
  [#extension: envoy.filters.network.mongo_proxy]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :access_log, 2, type: :string, json_name: "accessLog"
  field :delay, 3, type: Envoy.Config.Filter.Fault.V2.FaultDelay
  field :emit_dynamic_metadata, 4, type: :bool, json_name: "emitDynamicMetadata"
end

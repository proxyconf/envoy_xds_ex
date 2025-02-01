defmodule Envoy.Extensions.HealthCheckers.Thrift.V3.Thrift do
  @moduledoc """
  [#protodoc-title: Thrift]
  Thrift health checker :ref:`configuration overview <config_health_checkers_thrift>`.
  [#extension: envoy.health_checkers.thrift]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :method_name, 1, type: :string, json_name: "methodName", deprecated: false

  field :transport, 2,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.TransportType,
    enum: true,
    deprecated: false

  field :protocol, 3,
    type: Envoy.Extensions.Filters.Network.ThriftProxy.V3.ProtocolType,
    enum: true,
    deprecated: false
end

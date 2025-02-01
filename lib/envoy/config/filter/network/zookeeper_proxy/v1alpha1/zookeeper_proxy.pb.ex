defmodule Envoy.Config.Filter.Network.ZookeeperProxy.V1alpha1.ZooKeeperProxy do
  @moduledoc """
  [#protodoc-title: ZooKeeper proxy]
  ZooKeeper Proxy :ref:`configuration overview <config_network_filters_zookeeper_proxy>`.
  [#extension: envoy.filters.network.zookeeper_proxy]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :access_log, 2, type: :string, json_name: "accessLog"
  field :max_packet_bytes, 3, type: Google.Protobuf.UInt32Value, json_name: "maxPacketBytes"
end

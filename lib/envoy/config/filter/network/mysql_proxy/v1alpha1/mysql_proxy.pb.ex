defmodule Envoy.Config.Filter.Network.MysqlProxy.V1alpha1.MySQLProxy do
  @moduledoc """
  [#protodoc-title: MySQL proxy]
  MySQL Proxy :ref:`configuration overview <config_network_filters_mysql_proxy>`.
  [#extension: envoy.filters.network.mysql_proxy]
  """

  use Protobuf,
    full_name: "envoy.config.filter.network.mysql_proxy.v1alpha1.MySQLProxy",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :access_log, 2, type: :string, json_name: "accessLog"
end

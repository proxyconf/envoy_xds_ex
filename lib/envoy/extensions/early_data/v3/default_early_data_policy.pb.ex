defmodule Envoy.Extensions.EarlyData.V3.DefaultEarlyDataPolicy do
  @moduledoc """
  [#extension: envoy.route.early_data_policy.default]
  The default rule to allow/disallow a request to be sent as early data. It's an empty config now. Configuring it will disallow any request to be sent over early data.
  [#protodoc-title: HTTP request early data policy]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

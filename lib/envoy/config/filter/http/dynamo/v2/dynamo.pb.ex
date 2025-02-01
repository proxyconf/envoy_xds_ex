defmodule Envoy.Config.Filter.Http.Dynamo.V2.Dynamo do
  @moduledoc """
  Dynamo filter config.
  [#protodoc-title: Dynamo]
  Dynamo :ref:`configuration overview <config_http_filters_dynamo>`.
  [#extension: envoy.filters.http.dynamo]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

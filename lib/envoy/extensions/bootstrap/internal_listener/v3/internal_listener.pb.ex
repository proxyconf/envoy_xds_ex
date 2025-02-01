defmodule Envoy.Extensions.Bootstrap.InternalListener.V3.InternalListener do
  @moduledoc """
  Configuration for internal listener.
  [#protodoc-title: Internal Listener]
  Internal Listener :ref:`overview <config_internal_listener>`.
  [#extension: envoy.bootstrap.internal_listener]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :buffer_size_kb, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "bufferSizeKb",
    deprecated: false
end

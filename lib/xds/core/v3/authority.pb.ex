defmodule Xds.Core.V3.Authority do
  @moduledoc """
  xDS authority information.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
end

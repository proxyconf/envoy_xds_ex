defmodule Xds.Core.V3.Authority do
  @moduledoc """
  xDS authority information.
  """

  use Protobuf,
    full_name: "xds.core.v3.Authority",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
end

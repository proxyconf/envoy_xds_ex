defmodule Xds.Core.V3.CidrRange do
  @moduledoc """
  CidrRange specifies an IP Address and a prefix length to construct
  the subnet mask for a `CIDR <https://tools.ietf.org/html/rfc4632>`_ range.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :address_prefix, 1, type: :string, json_name: "addressPrefix", deprecated: false

  field :prefix_len, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "prefixLen",
    deprecated: false
end

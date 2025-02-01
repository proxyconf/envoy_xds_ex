defmodule Envoy.Type.Matcher.V3.AddressMatcher do
  @moduledoc """
  Match an IP against a repeated CIDR range. This matcher is intended to be
  used in other matchers, for example in the filter state matcher to match a
  filter state object as an IP.
  [#protodoc-title: Address Matcher]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ranges, 1, repeated: true, type: Xds.Core.V3.CidrRange
end

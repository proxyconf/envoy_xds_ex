defmodule Envoy.Extensions.Matching.InputMatchers.Ip.V3.Ip do
  @moduledoc """
  This input matcher matches IPv4 or IPv6 addresses against a list of CIDR
  ranges. It returns true if and only if the input IP belongs to at least one
  of these CIDR ranges. Internally, it uses a Level-Compressed trie, as
  described in the paper `IP-address lookup using LC-tries
  <https://www.nada.kth.se/~snilsson/publications/IP-address-lookup-using-LC-tries/>`_
  by S. Nilsson and G. Karlsson. For "big" lists of IPs, this matcher is more
  efficient than multiple single IP matcher, that would have a linear cost.
  [#protodoc-title: IP matcher]
  [#extension: envoy.matching.matchers.ip]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :cidr_ranges, 1,
    repeated: true,
    type: Envoy.Config.Core.V3.CidrRange,
    json_name: "cidrRanges",
    deprecated: false

  field :stat_prefix, 2, type: :string, json_name: "statPrefix", deprecated: false
end

defmodule Envoy.Extensions.Clusters.Common.Dns.V3.DnsLookupFamily do
  @moduledoc """
  [#protodoc-title: DNS configuration for clusters]
  """

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :UNSPECIFIED, 0
  field :AUTO, 1
  field :V4_ONLY, 2
  field :V6_ONLY, 3
  field :V4_PREFERRED, 4
  field :ALL, 5
end

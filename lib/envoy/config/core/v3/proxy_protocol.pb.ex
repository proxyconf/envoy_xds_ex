defmodule Envoy.Config.Core.V3.ProxyProtocolPassThroughTLVs.PassTLVsMatchType do
  use Protobuf,
    enum: true,
    full_name: "envoy.config.core.v3.ProxyProtocolPassThroughTLVs.PassTLVsMatchType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :INCLUDE_ALL, 0
  field :INCLUDE, 1
end

defmodule Envoy.Config.Core.V3.ProxyProtocolConfig.Version do
  use Protobuf,
    enum: true,
    full_name: "envoy.config.core.v3.ProxyProtocolConfig.Version",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :V1, 0
  field :V2, 1
end

defmodule Envoy.Config.Core.V3.ProxyProtocolPassThroughTLVs do
  @moduledoc """
  [#protodoc-title: Proxy protocol]
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.ProxyProtocolPassThroughTLVs",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :match_type, 1,
    type: Envoy.Config.Core.V3.ProxyProtocolPassThroughTLVs.PassTLVsMatchType,
    json_name: "matchType",
    enum: true

  field :tlv_type, 2, repeated: true, type: :uint32, json_name: "tlvType", deprecated: false
end

defmodule Envoy.Config.Core.V3.TlvEntry do
  @moduledoc """
  Represents a single Type-Length-Value (TLV) entry.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.TlvEntry",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :type, 1, type: :uint32, deprecated: false
  field :value, 2, type: :bytes

  field :format_string, 3,
    type: Envoy.Config.Core.V3.SubstitutionFormatString,
    json_name: "formatString"
end

defmodule Envoy.Config.Core.V3.ProxyProtocolConfig do
  use Protobuf,
    full_name: "envoy.config.core.v3.ProxyProtocolConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :version, 1, type: Envoy.Config.Core.V3.ProxyProtocolConfig.Version, enum: true

  field :pass_through_tlvs, 2,
    type: Envoy.Config.Core.V3.ProxyProtocolPassThroughTLVs,
    json_name: "passThroughTlvs"

  field :added_tlvs, 3,
    repeated: true,
    type: Envoy.Config.Core.V3.TlvEntry,
    json_name: "addedTlvs"
end

defmodule Envoy.Config.Core.V3.PerHostConfig do
  use Protobuf,
    full_name: "envoy.config.core.v3.PerHostConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :added_tlvs, 1,
    repeated: true,
    type: Envoy.Config.Core.V3.TlvEntry,
    json_name: "addedTlvs"
end

defmodule Envoy.Config.Core.V3.ProxyProtocolPassThroughTLVs.PassTLVsMatchType do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :INCLUDE_ALL, 0
  field :INCLUDE, 1
end

defmodule Envoy.Config.Core.V3.ProxyProtocolConfig.Version do
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :V1, 0
  field :V2, 1
end

defmodule Envoy.Config.Core.V3.ProxyProtocolPassThroughTLVs do
  @moduledoc """
  [#protodoc-title: Proxy protocol]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :match_type, 1,
    type: Envoy.Config.Core.V3.ProxyProtocolPassThroughTLVs.PassTLVsMatchType,
    json_name: "matchType",
    enum: true

  field :tlv_type, 2, repeated: true, type: :uint32, json_name: "tlvType", deprecated: false
end

defmodule Envoy.Config.Core.V3.ProxyProtocolConfig do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :version, 1, type: Envoy.Config.Core.V3.ProxyProtocolConfig.Version, enum: true

  field :pass_through_tlvs, 2,
    type: Envoy.Config.Core.V3.ProxyProtocolPassThroughTLVs,
    json_name: "passThroughTlvs"
end

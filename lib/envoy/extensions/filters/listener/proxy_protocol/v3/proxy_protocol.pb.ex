defmodule Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.KeyValuePair do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :metadata_namespace, 1, type: :string, json_name: "metadataNamespace"
  field :key, 2, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.Rule do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :tlv_type, 1, type: :uint32, json_name: "tlvType", deprecated: false

  field :on_tlv_present, 2,
    type: Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.KeyValuePair,
    json_name: "onTlvPresent"
end

defmodule Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :rules, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.Rule

  field :allow_requests_without_proxy_protocol, 2,
    type: :bool,
    json_name: "allowRequestsWithoutProxyProtocol"

  field :pass_through_tlvs, 3,
    type: Envoy.Config.Core.V3.ProxyProtocolPassThroughTLVs,
    json_name: "passThroughTlvs"

  field :disallowed_versions, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.ProxyProtocolConfig.Version,
    json_name: "disallowedVersions",
    enum: true

  field :stat_prefix, 5, type: :string, json_name: "statPrefix"
end
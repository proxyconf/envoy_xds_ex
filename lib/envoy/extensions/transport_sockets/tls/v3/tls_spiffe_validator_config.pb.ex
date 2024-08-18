defmodule Envoy.Extensions.TransportSockets.Tls.V3.SPIFFECertValidatorConfig.TrustDomain do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :trust_bundle, 2, type: Envoy.Config.Core.V3.DataSource, json_name: "trustBundle"
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.SPIFFECertValidatorConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :trust_domains, 1,
    repeated: true,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SPIFFECertValidatorConfig.TrustDomain,
    json_name: "trustDomains",
    deprecated: false
end
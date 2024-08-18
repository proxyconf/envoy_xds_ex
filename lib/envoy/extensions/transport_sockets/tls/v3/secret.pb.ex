defmodule Envoy.Extensions.TransportSockets.Tls.V3.GenericSecret do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :secret, 1, type: Envoy.Config.Core.V3.DataSource, deprecated: false
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :sds_config, 2, type: Envoy.Config.Core.V3.ConfigSource, json_name: "sdsConfig"
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.Secret do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  oneof :type, 0

  field :name, 1, type: :string

  field :tls_certificate, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V3.TlsCertificate,
    json_name: "tlsCertificate",
    oneof: 0

  field :session_ticket_keys, 3,
    type: Envoy.Extensions.TransportSockets.Tls.V3.TlsSessionTicketKeys,
    json_name: "sessionTicketKeys",
    oneof: 0

  field :validation_context, 4,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CertificateValidationContext,
    json_name: "validationContext",
    oneof: 0

  field :generic_secret, 5,
    type: Envoy.Extensions.TransportSockets.Tls.V3.GenericSecret,
    json_name: "genericSecret",
    oneof: 0
end
defmodule Envoy.Admin.V2alpha.Certificates do
  @moduledoc """
  Proto representation of certificate details. Admin endpoint uses this wrapper for `/certs` to
  display certificate information. See :ref:`/certs <operations_admin_interface_certs>` for more
  information.
  [#protodoc-title: Certificates]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :certificates, 1, repeated: true, type: Envoy.Admin.V2alpha.Certificate
end

defmodule Envoy.Admin.V2alpha.Certificate do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ca_cert, 1,
    repeated: true,
    type: Envoy.Admin.V2alpha.CertificateDetails,
    json_name: "caCert"

  field :cert_chain, 2,
    repeated: true,
    type: Envoy.Admin.V2alpha.CertificateDetails,
    json_name: "certChain"
end

defmodule Envoy.Admin.V2alpha.CertificateDetails do
  @moduledoc """
  [#next-free-field: 7]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :path, 1, type: :string
  field :serial_number, 2, type: :string, json_name: "serialNumber"

  field :subject_alt_names, 3,
    repeated: true,
    type: Envoy.Admin.V2alpha.SubjectAlternateName,
    json_name: "subjectAltNames"

  field :days_until_expiration, 4, type: :uint64, json_name: "daysUntilExpiration"
  field :valid_from, 5, type: Google.Protobuf.Timestamp, json_name: "validFrom"
  field :expiration_time, 6, type: Google.Protobuf.Timestamp, json_name: "expirationTime"
end

defmodule Envoy.Admin.V2alpha.SubjectAlternateName do
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :name, 0

  field :dns, 1, type: :string, oneof: 0
  field :uri, 2, type: :string, oneof: 0
  field :ip_address, 3, type: :string, json_name: "ipAddress", oneof: 0
end

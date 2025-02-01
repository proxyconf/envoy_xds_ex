defmodule Envoy.Extensions.Matching.CommonInputs.Ssl.V3.UriSanInput do
  @moduledoc """
  List of comma-delimited URIs in the SAN field of the peer certificate for a downstream.
  [#extension: envoy.matching.inputs.uri_san]
  [#protodoc-title: Common SSL matching inputs]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Ssl.V3.DnsSanInput do
  @moduledoc """
  List of comma-delimited DNS entries in the SAN field of the peer certificate for a downstream.
  [#extension: envoy.matching.inputs.dns_san]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Ssl.V3.SubjectInput do
  @moduledoc """
  Input that matches the subject field of the peer certificate in RFC 2253 format for a
  downstream.
  [#extension: envoy.matching.inputs.subject]
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

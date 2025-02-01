defmodule Envoy.Extensions.TransportSockets.S2a.V3.S2AConfiguration do
  @moduledoc """
  [#not-implemented-hide:]
  Configuration for S2A transport socket. This allows Envoy clients to
  configure how to offload mTLS handshakes to the S2A service.
  https://github.com/google/s2a-go#readme
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :s2a_address, 1, type: :string, json_name: "s2aAddress", deprecated: false
end

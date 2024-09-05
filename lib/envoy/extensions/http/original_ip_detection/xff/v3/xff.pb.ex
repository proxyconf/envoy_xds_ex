defmodule Envoy.Extensions.Http.OriginalIpDetection.Xff.V3.XffConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :xff_num_trusted_hops, 1, type: :uint32, json_name: "xffNumTrustedHops"
end
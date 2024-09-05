defmodule Envoy.Config.Filter.Listener.OriginalSrc.V2alpha1.OriginalSrc do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :bind_port, 1, type: :bool, json_name: "bindPort"
  field :mark, 2, type: :uint32
end
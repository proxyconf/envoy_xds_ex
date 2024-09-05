defmodule Envoy.Extensions.Retry.Priority.PreviousPriorities.V3.PreviousPrioritiesConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :update_frequency, 1, type: :int32, json_name: "updateFrequency", deprecated: false
end
defmodule Envoy.Api.V2.Core.BackoffStrategy do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :base_interval, 1,
    type: Google.Protobuf.Duration,
    json_name: "baseInterval",
    deprecated: false

  field :max_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "maxInterval",
    deprecated: false
end
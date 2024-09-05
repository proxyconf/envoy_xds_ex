defmodule Envoy.Watchdog.V3.AbortActionConfig do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :wait_duration, 1, type: Google.Protobuf.Duration, json_name: "waitDuration"
end
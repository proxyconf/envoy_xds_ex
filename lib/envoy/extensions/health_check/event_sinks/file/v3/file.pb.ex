defmodule Envoy.Extensions.HealthCheck.EventSinks.File.V3.HealthCheckEventFileSink do
  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :event_log_path, 1, type: :string, json_name: "eventLogPath", deprecated: false
end
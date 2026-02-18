defmodule Envoy.Extensions.HealthCheck.EventSinks.File.V3.HealthCheckEventFileSink do
  @moduledoc """
  Health check event file sink.
  The health check event will be converted to JSON.
  [#protodoc-title: Health Check Log File Sink]
  [#extension: envoy.health_check.event_sinks.file]
  """

  use Protobuf,
    full_name: "envoy.extensions.health_check.event_sinks.file.v3.HealthCheckEventFileSink",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :event_log_path, 1, type: :string, json_name: "eventLogPath", deprecated: false
end

defmodule Envoy.Extensions.Rbac.AuditLoggers.Stream.V3.StdoutAuditLog do
  @moduledoc """
  Custom configuration for the RBAC audit logger that writes log entries
  directly to the operating system's standard output.
  The logger outputs in JSON format and is currently not configurable.
  [#protodoc-title: Standard Streams RBAC Audit Loggers]
  [#not-implemented-hide:]
  """

  use Protobuf,
    full_name: "envoy.extensions.rbac.audit_loggers.stream.v3.StdoutAuditLog",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

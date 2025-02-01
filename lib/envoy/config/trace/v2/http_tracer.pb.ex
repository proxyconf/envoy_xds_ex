defmodule Envoy.Config.Trace.V2.Tracing.Http do
  @moduledoc """
  Configuration for an HTTP tracer provider used by Envoy.

  The configuration is defined by the
  :ref:`HttpConnectionManager.Tracing <envoy_api_msg_config.filter.network.http_connection_manager.v2.HttpConnectionManager.Tracing>`
  :ref:`provider <envoy_api_field_config.filter.network.http_connection_manager.v2.HttpConnectionManager.Tracing.provider>`
  field.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Trace.V2.Tracing do
  @moduledoc """
  The tracing configuration specifies settings for an HTTP tracer provider used by Envoy.

  Envoy may support other tracers in the future, but right now the HTTP tracer is the only one
  supported.

  .. attention::

  Use of this message type has been deprecated in favor of direct use of
  :ref:`Tracing.Http <envoy_api_msg_config.trace.v2.Tracing.Http>`.
  [#protodoc-title: Tracing]
  Tracing :ref:`architecture overview <arch_overview_tracing>`.
  """

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :http, 1, type: Envoy.Config.Trace.V2.Tracing.Http
end
